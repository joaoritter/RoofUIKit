//
//  RoofUIFormTextFieldTableViewCell.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 7/25/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit

import Former

///A cell that is a field in a form.
class RoofUIFormTextFieldTableViewCell: RoofUITableViewCell, RoofUITextFieldFormableRow {
    
    //MARK: public vars
    
    lazy var textField: RoofUITextField = {
        let textField = RoofUITextField()
        
        ///Set immutable properties
        textField.autocorrectionType = .no
        textField.adjustsFontSizeToFitWidth = true
        textField.minimumFontSize = roofUIFontSizeMinimum
        
        return textField
    }()

    
    //MARK: private vars

    ///The first text field.
    private let verticalPadding: CGFloat = roofUIMarginC
    private let verticalLargePadding: CGFloat = roofUIMarginD
    
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
        guard let style_ = style_ as? RoofUITableViewCellTextFieldStyle else { return }
        
        textField.style_ = style_.textFieldTextStyle
        textField.textAlignment = style_.textFieldAlignment
    }
}
