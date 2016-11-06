//
//  RoofUIFormTableViewCell.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 5/24/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit

import Former

///A cell that is a field in a form.
class RoofUIFormTitleTextFieldTableViewCell: RoofUITableViewCell, RoofUITextFieldFormableRow {

    //MARK: public vars
    lazy var textField: RoofUITextField = {
        let textField = RoofUITitleTextField()
        
        ///Set default properties
        textField.autocorrectionType = .no
        textField.adjustsFontSizeToFitWidth = true
        textField.minimumFontSize = roofUIFontSizeMinimum
        textField.textAlignment = .right
        return textField
    }()
    
    ///The title of the cell.
    var title: String? {
        get {
            return (textField as? RoofUITitleTextField)?.title
        }
        set {
            (textField as? RoofUITitleTextField)?.title = newValue
        }
    }
    
    
    //MARK: private vars
    private let verticalPadding: CGFloat = roofUIFormCellVerticalPadding

    //MARK: public funcs

    override func addSubviews() {
        super.addSubviews()
        
        contentView.addSubview(textField)
    }
    
    override func makeConstraints() {        
        textField.snp.remakeConstraints {
            (make) -> Void in
            make.right.equalTo(contentView).offset(-horizontalPadding)
            make.left.equalTo(contentView).offset(horizontalPadding)
            make.top.equalTo(contentView).offset(verticalPadding)
            make.bottom.equalTo(contentView).offset(-verticalPadding)
        }


        super.makeConstraints()
    }

    /// Sets mutable properties based on the set style
    override func updateStyle() {
        
        super.updateStyle()
        
        ///There must be a style.
        guard let style_ = style_ as? RoofUITableViewCellTitleTextFieldStyle else { return }
        
        textField.style_ = style_.textFieldTextStyle
    }
}
