//
//  RoofUIFieldButtonSheetView.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 5/21/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Former
import Spring
import AudioToolbox

///A button sheet with text fields.
class RoofUIFormButtonSheetView: RoofUIButtonSheetView {
    
    //MARK: public vars
    
    ///The image view.
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        /// Set immutable properties
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    ///The text view.
    lazy var textView: RoofUITextView = {
        let textView = RoofUITextView()
        
        /// Set immutable proprties
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.showsVerticalScrollIndicator = false
        textView.showsHorizontalScrollIndicator = false
        textView.backgroundColor = nil
        
        return textView
    }()
    
    /// The form utility.
    lazy var former: Former = {
       [unowned self] in
        return Former(tableView: self.formTable)
    }()

    ///If the form is locked, its fields are read-only.
    var locked: Bool = false {
        didSet {
            guard locked != oldValue else { return }
            
            for rowFormer in former.rowFormers  {
                if let textFieldRowFormer = rowFormer as? RoofUITitleTextFieldRowFormer<RoofUIFormTitleTextFieldTableViewCell> {
                    textFieldRowFormer.cell.textField.isEnabled = !locked
                }
            }
        }
    }
    
    ///Used for navigating preview views.
    weak var formNavigator: RoofUIPreviewRowFormerNavigator?

    var textViewPaddingBottomConstraint: Constraint?

    
    //MARK: private vars
    
    lazy private var formTable: RoofUIFormTableView = {
        let table = RoofUIFormTableView(
            frame: CGRect.zero,
            style: .grouped
        )
        return table
    }()
    
    ///The padding for the text.
    private let bodyTextHorizontalPadding: CGFloat = roofUIMarginA
    private var textViewPaddingTopConstraint: Constraint?
    private var imageViewPaddingTopConstraint: Constraint?
    private let formHeightAdjustmentTime: TimeInterval = roofUITimeIntervalShort
    private let imageMarginBottom: CGFloat = roofUIMarginC
    private let textMarginBottom: CGFloat = roofUIMarginD
    private var heightConstraint: Constraint?
    private var textViewHeightConstraint: Constraint?
    private var imageWidthConstraint: Constraint?
    private var imageHeightConstraint: Constraint?
    
    //MARK: public funcs

    override func addSubviews() {
        super.addSubviews()
        
        bodyView.addSubview(formTable)
        bodyView.addSubview(imageView)
        bodyView.addSubview(textView)
    }
    
    override func makeConstraints() {
        imageView.snp.remakeConstraints {
            (make) -> Void in
            imageViewPaddingTopConstraint = make.top.equalTo(bodyView).offset(bodyMargin).constraint
            make.centerX.equalTo(bodyView)
            
            ///No overflows.
            make.left.greaterThanOrEqualTo(bodyView).offset(bodyTextHorizontalPadding)
            make.right.lessThanOrEqualTo(bodyView).offset(-bodyTextHorizontalPadding)
            
            imageWidthConstraint = make.width.equalTo(0).constraint
            imageHeightConstraint =  make.height.equalTo(0).constraint
        }

        textView.snp.remakeConstraints {
            (make) -> Void in
            textViewPaddingTopConstraint = make.top.equalTo(imageView.snp.bottom).offset(imageMarginBottom).constraint
            textViewPaddingTopConstraint?.activate()
            
            make.centerX.equalTo(bodyView)
            textViewPaddingBottomConstraint = make.bottom.equalTo(formTable.snp.top).offset(-textMarginBottom).constraint

            ///No overflows.
            make.left.greaterThanOrEqualTo(bodyView).offset(bodyTextHorizontalPadding)
            make.right.lessThanOrEqualTo(bodyView).offset(-bodyTextHorizontalPadding)
        }
        
        formTable.snp.remakeConstraints {
            (make) -> Void in
            
            make.left.equalTo(bodyView)
            make.right.equalTo(bodyView)
            make.bottom.equalTo(bodyView)
            
            ///Exhaggerate in order to determine content size.
            make.height.equalTo(1000)
        }
        
        super.makeConstraints()
    }
    
    override func updateConstraints() {

        if let width = (dataSource as? RoofUIFormButtonSheetDataSource)?.widthForImageInRoofUIFormButtonSheet(formButtonSheet: self),
            let image = imageView.image {
            ///The image's aspect ratio.
            let aspectRatio = image.size.height / image.size.width
            
            imageWidthConstraint?.update(width as ConstraintOffsetTarget)
            imageWidthConstraint?.update(roofUILayoutPriorityHigh as ConstraintPriorityTarget)
            imageHeightConstraint?.update((width * aspectRatio) as ConstraintOffsetTarget)

        }
        
        ///Shrink the textView if there is no text.
        if (textView.text == nil || textView.text == "") {
            textViewHeightConstraint?.activate()
            textViewPaddingTopConstraint?.update(0 as ConstraintOffsetTarget)
            textViewPaddingBottomConstraint?.update(0 as ConstraintOffsetTarget)
        }
        else {
            textViewHeightConstraint?.deactivate()
            
            textViewPaddingTopConstraint?.update(imageMarginBottom as ConstraintOffsetTarget)
            textViewPaddingBottomConstraint?.update(-textMarginBottom as ConstraintOffsetTarget)
        }
        
        ///Shrink the image view if there is not image.
        if (imageView.image == nil) {
            imageViewPaddingTopConstraint?.update(0 as ConstraintOffsetTarget)
        }
        else {
            imageViewPaddingTopConstraint?.update(bodyMargin as ConstraintOffsetTarget)
        }

        super.updateConstraints()
    }
    
    override func setup() {
        super.setup()
        makeForm()
        formTable.setup()
    }
    

    /// Assembles the form. Override this method to add new rows.
    func makeForm() {
        former.removeAll()
        
        former.onCellSelected {
            indexPath in
            if let previewRowFormer = self.former.rowFormer(indexPath: indexPath) as? RoofUIPreviewRowFormer<RoofUIFormPreviewTableViewCell> {
                self.formNavigator?.showOverlayForPreivewRowFormer(previewRowFormer: previewRowFormer)
            }
        }
    }
    
    /// Adjusts the height of the form by an expected number of rows.
    func incrementHeightOfFormAnimated(_ numberOfRows: Int, animated: Bool, completion: ((Bool) -> Void)? = nil) {
        let height = formTable.contentSize.height
        let newHeight = height + (formTable.estimatedRowHeight * CGFloat(numberOfRows))
        setHeightOfForm(newHeight, animated: animated, completion: completion)
    }
    
    /// Recalculates the expected height of the form.
    func adjustHeightOfFormAnimated(_ animated: Bool, completion: ((Bool) -> Void)? = nil) {
        self.layoutIfNeeded()

        let height: CGFloat = formTable.contentSize.height
        setHeightOfForm(height, animated: animated, completion: completion)
    }

    /// If the form has empty fields.
    func hasEmptyField(_ omittingField: UITextField) -> Bool {
        
        //MAKE ALL OF CELLS CONFORM TO A PROTOCOL.
        let textFieldRowFormers = self.former.rowFormers.filter({
            $0 is RoofUITextFieldsRowFormer
        })
        
        var fields = [(RowFormer, RoofUITextField)]()
        for rowFormer in textFieldRowFormers {
            if let textFields = (rowFormer as? RoofUITextFieldsRowFormer)?.textFields {
                for field in textFields {
                    fields.append((rowFormer, field))
                }
            }
        }
        
        if let index = fields.map({$0.1}).index(of: omittingField) {
            //check for empty subsequent fields
            for i in index+1..<fields.count {
                let subsequentRoofTextFormer = fields[i].0
                if let textFieldRowFormer = subsequentRoofTextFormer as? RoofUITextFieldsRowFormer {
                    for field in textFieldRowFormer.textFields {
                        if field.text == "" && field != omittingField {
                            return true
                        }
                    }
                }
            }
            //check for empty previous fields
            for i in 0..<index {
                let priorRoofTextFormer = fields[i].0
                if let textFieldRowFormer = priorRoofTextFormer as? RoofUITextFieldsRowFormer {
                    for field in textFieldRowFormer.textFields {
                        if field.text == "" && field != omittingField {
                            return true
                        }
                    }
                }
            }
        }
        
        return false
    }

    /// Sets the keyboard return key type for the given field.
    func setReturnKeyTypeForTextField(_ textField: RoofUITextField) {
        
        guard let textFieldRowFormers = former.rowFormers as? [RoofUITitleTextFieldRowFormer<RoofUIFormTitleTextFieldTableViewCell>] else {
            return
        }
        
        let fields = textFieldRowFormers.map{ $0.cell.textField }
        for field in fields {
            if field.text == "" && field != textField {
                textField.returnKeyType = UIReturnKeyType.next
                return
            }
        }
        textField.returnKeyType = UIReturnKeyType.done
    }
    
    
    
    ///Reloads the dataSource data.
    override func reloadData() {
        super.reloadData()
        
        ///If there is no data source, there's nothing to do.
        guard let dataSource = dataSource as? RoofUIFormButtonSheetDataSource else { return }
        
        imageView.image = dataSource.imageForRoofUIFormButtonSheet(formButtonSheet: self)
        
        var text = dataSource.textForRoofUIFormButtonSheet(formButtonSheet: self) ?? ""
        
        if let subtext = dataSource.subtextForRoofUIFormButtonSheet(formButtonSheet: self) {
            text += "\n\n" + subtext
            textView.subtext = subtext
        }
        
        textView.text = text == "" ? nil : text
        
        ///Updates image width.
        setNeedsUpdateConstraints()
    }
    
    /// Sets mutable properties based on the set style
    override func updateStyle() {
        super.updateStyle()
        
        ///Make sure the style is an image button sheet style.
        guard let style_ = style_ as? RoofUIButtonSheetFormStyle else { return }
        textView.style_ = style_.headerLabelStyle
        textView.subtextStyle_ = style_.subheaderLabelStyle
    }

    
    //MARK: private funcs
        
    /// Sets the height of the form.
    private func setHeightOfForm(_ height: CGFloat, animated: Bool, completion: ((Bool) -> Void)? = nil) {
        let heightDifference = formTable.frame.height - height
        
        UIView.animate(
            withDuration: animated ? formHeightAdjustmentTime : 0,
            animations:{
                self.formTable.snp.updateConstraints {
                    (make) -> Void in
                    make.height.equalTo(height)
                }
                let newRect = CGRect(
                    x: 0,
                    y: 0,
                    width: self.buttonSheetContainer.frame.width,
                    height: self.buttonSheetContainer.frame.height - heightDifference
                )
                self.buttonSheetContainer.layer.shadowPath = UIBezierPath(rect: newRect).cgPath

                self.layoutIfNeeded()
            },
            completion: completion
        )
    }

}


///A table view that doesn't autoscroll.
private class RoofUIFormTableView: UITableView {
    
    /// Setup the form table.
    override func setup() {
        super.setup()
        separatorStyle = .none
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        contentInset = UIEdgeInsets(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0
        )
        rowHeight = UITableViewAutomaticDimension
        sectionHeaderHeight = 0
        sectionFooterHeight = 0
        estimatedRowHeight = 55
        estimatedSectionHeaderHeight = 1
        estimatedSectionFooterHeight = 1
        bounces = false
        isScrollEnabled = false
        backgroundColor = nil
        
        tableHeaderView = UIView(frame: CGRect(x: 0,y: 0,width: 0.01,height: 0.01))
        tableFooterView = UIView(frame: CGRect(x: 0,y: 0,width: 0.01,height: 0.01))
    }
    
    override func setContentOffset(_ contentOffset: CGPoint, animated: Bool) {
        
        var zoomedView: UIView? = self.superview
        while let superview = zoomedView?.superview {
            if let zoomedScrollView = zoomedView as? UIScrollView {
                zoomedScrollView.setContentOffset(contentOffset, animated: animated)
                return
            }
            zoomedView = superview
        }
        
        super.setContentOffset(CGPoint.zero, animated: false)
    }
}
