//
//  RoofUIFormPreviewTableViewCell.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 7/24/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit

import Former

///A cell that is a picker with a preview in a form.
class RoofUIFormPreviewTableViewCell: RoofUITableViewCell, RoofUIPreviewFieldFormableRow {

    //MARK: public vars
    
    lazy var titleLabel: RoofUILabel = {
        let label = RoofUILabel()
        
        ///Set immutable properties
        label.frame = CGRect(
            x: self.horizontalPadding,
            y: self.verticalPadding,
            width: 0,
            height: 0
        )
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = roofUIMinimumScaleFactor
        return label

    }()
    
    lazy var contentLabel: RoofUILabel = {
        let contentLabel = RoofUILabel()
        
        ///Set immutable properties
        contentLabel.textAlignment = .right
        contentLabel.numberOfLines = 0
        contentLabel.lineBreakMode = .byWordWrapping
        contentLabel.text = " "
        
        return contentLabel
    }()
    
    var title: String? {
        get {
            return titleLabel.text
        }
        set {
            titleLabel.text = newValue
            titleLabel.sizeToFit()
        }
    }
    var content: String? {
        get {
            return contentLabel.text
        }
        set {
            contentLabel.text = newValue

        }
    }

    //MARK: private vars
    private let verticalPadding: CGFloat = roofUIFormCellVerticalPadding

    

    //MARK: public funcs
    
    override func addSubviews() {
        super.addSubviews()
        
        contentView.addSubview(contentLabel)
        contentView.addSubview(titleLabel)
    }
    
    override func makeConstraints() {
        
        contentLabel.snp.remakeConstraints {
            (make) -> Void in
            
            make.left.equalTo(titleLabel.snp.right).offset(horizontalPadding)
            make.top.equalTo(contentView).offset(verticalPadding)
            make.bottom.equalTo(contentView).offset(-verticalPadding)
            make.right.equalTo(contentView).offset(-horizontalPadding)
            
            ///Arbitraty but required.
            make.height.greaterThanOrEqualTo(10)
        }
        
        super.makeConstraints()
    }
    
    override func updateConstraints() {
        ///Alows the multi-row to work. The 3*horizontalPadding accounts for the left padding, the right padding, and the in between padding.
        contentLabel.preferredMaxLayoutWidth = self.bounds.size.width - titleLabel.frame.width - 3*horizontalPadding

        ///Call this at the end, according to Apple.
        super.updateConstraints()
    }

    /// Sets mutable properties based on the set style
    override func updateStyle() {
        
        super.updateStyle()
        
        ///There must be a style.
        guard let style_ = style_ as? RoofUITableViewCellPreviewStyle else { return }
        
        contentLabel.style_ = style_.labelTextStyle
        titleLabel.style_ = style_.titleTextStyle
        titleLabel.sizeToFit()
    }
}
