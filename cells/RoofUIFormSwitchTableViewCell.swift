//
//  RoofUIFormSwitchTableViewCell.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 7/11/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit

import Former

///A cell that is a switch in a form.
class RoofUIFormSwitchTableViewCell: RoofUITableViewCell, RoofUISwitchFormableRow {
    
    //MARK: public vars
    lazy var label: RoofUILabel = {
        let label = RoofUILabel()
        
        ///Set immutable properties
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    ///The switch.
    let toggleSwitch: RoofUISwitch = RoofUISwitch()

    //MARK: private vars
    private let verticalPadding: CGFloat = roofUIFormCellVerticalPadding


    //MARK: public funcs
    
    override func addSubviews() {
        super.addSubviews()
        
        contentView.addSubview(label)
        contentView.addSubview(toggleSwitch)
    }
    
    override func makeConstraints() {
        label.snp.remakeConstraints {
            (make) -> Void in
            
            make.left.equalTo(contentView).offset(horizontalPadding)
            make.top.equalTo(contentView).offset(verticalPadding)
            make.bottom.equalTo(contentView).offset(-verticalPadding)
            make.right.equalTo(toggleSwitch).offset(-horizontalPadding)
        }
        
        toggleSwitch.snp.remakeConstraints {
            (make) -> Void in
            
            make.centerY.equalTo(contentView)
            make.right.equalTo(contentView).offset(-horizontalPadding)
        }
        
        super.makeConstraints()
    }
    
    /// Sets mutable properties based on the set style
    override func updateStyle() {
        super.updateStyle()
        
        ///There must be a style.
        guard let style_ = style_ as? RoofUITableViewCellSwitchStyle else { return }
        
        label.style_ = style_.labelTextStyle
        
        toggleSwitch.style_ = style_.switchStyle
    }
}
