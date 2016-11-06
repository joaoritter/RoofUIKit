//
//  RoofUIFormCheckTableViewCell.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 6/12/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit

import Former

///A cell that is a label in a form.
class RoofUIFormCheckTableViewCell: RoofUITableViewCell, RoofUICheckFormableRow {
    
    //MARK: public vars
    
    lazy var label: RoofUILabel = {
        let label = RoofUILabel()
        
        /// Set immutable properties
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = roofUIMinimumScaleFactor
        
        return label
    }()

    //MARK: private vars
    private let verticalPadding: CGFloat = roofUIFormCellVerticalPadding

    //MARK: public funcs
    
    override func addSubviews() {
        super.addSubviews()
        
        contentView.addSubview(label)
    }
    
    override func makeConstraints() {
        
        label.snp.remakeConstraints {
            (make) -> Void in
            
            make.left.equalTo(contentView).offset(horizontalPadding)
            make.top.equalTo(contentView).offset(verticalPadding).priority(roofUILayoutPriorityHigh)
            make.bottom.equalTo(contentView).offset(-verticalPadding).priority(roofUILayoutPriorityHigh)
            make.right.equalTo(contentView).offset(-horizontalPadding)

        }
        
        super.makeConstraints()
    }
    
    override func setup() {
        super.setup()
        selectionStyle = .none
    }
    
    /// Sets mutable properties based on the set style
    override func updateStyle() {
        
        super.updateStyle()
        
        ///There must be a style.
        guard let style_ = style_ as? RoofUITableViewCellCheckStyle else { return }
                
        label.style_ = style_.labelTextStyle
    }
}
