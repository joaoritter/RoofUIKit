//
//  RoofUITableViewCell.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 4/23/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Spring

class RoofUITableViewACell: RoofUITableViewCell {
    
    //MARK: public vars

    lazy var leftLabel: RoofUILabel = {
        let label = RoofUILabel()
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = roofUIMinimumScaleFactor
        
        return label
    }()
    
    let topRightLabel = RoofUILabel()
    let bottomRightLabel = RoofUILabel()

    //MARK: private vars
    private let verticalPadding: CGFloat = roofUIMargin0
    private let verticalMargin: CGFloat = 0


    //MARK: public funcs

    override func addSubviews() {
        super.addSubviews()
        
        ///Add the labels.
        contentView.addSubview(leftLabel)
        contentView.addSubview(topRightLabel)
        contentView.addSubview(bottomRightLabel)
    }
    
    override func makeConstraints() {
        
        leftLabel.snp.remakeConstraints {
            (make) -> Void in
            make.left.equalTo(self.contentView).offset(horizontalPadding)
            make.centerY.equalTo(self.contentView)
            make.right.lessThanOrEqualTo(topRightLabel.snp.left).offset(-horizontalPadding)
        }
        
        bottomRightLabel.snp.remakeConstraints {
            (make) -> Void in
            make.right.equalTo(self.contentView).offset(-horizontalPadding)
            make.top.equalTo(topRightLabel.snp.bottom).offset(verticalMargin)
            make.bottom.equalTo(self.contentView).offset(-verticalPadding)
        }
        
        topRightLabel.snp.remakeConstraints {
            (make) -> Void in
            make.right.equalTo(self.contentView).offset(-horizontalPadding)
            make.top.equalTo(self.contentView).offset(verticalPadding)
        }
        
        ///Dont shrink the top right label.
        topRightLabel.setContentCompressionResistancePriority(1000, for: UILayoutConstraintAxis.horizontal)
        
        super.makeConstraints()
    }
    
    /// Sets the weights of the string.
    func setAttributedBottomRightTextToString(_ string: String, andThinRanges ranges: [NSRange]) {
        guard let style_ = style_ as? RoofUITableViewCellActionStyle else { return }
        let normalAttributes = [
            NSFontAttributeName: style_.bottomRightTextStyle.font ?? UIFont.systemFont(ofSize: 14),
            NSForegroundColorAttributeName: style_.bottomRightTextStyle.textColor ?? UIColor.black
        ]
        let attributedString = NSMutableAttributedString(
            string: string,
            attributes: normalAttributes
        )
        
        for range in ranges {
            let boldAttributes = [
                NSFontAttributeName: style_.bottomRightThinTextStyle.font ?? UIFont.systemFont(ofSize: 14),
                NSForegroundColorAttributeName: style_.bottomRightThinTextStyle.textColor ?? UIColor.black
            ]
            attributedString.setAttributes(boldAttributes, range: range)
        }
        self.bottomRightLabel.attributedText = attributedString
    }
    
    /// Sets mutable properties based on the set style
    override func updateStyle() {
        super.updateStyle()
        
        ///There must be a style.
        guard let style_ = style_ as? RoofUITableViewCellActionStyle else { return }
        
        leftLabel.style_ = style_.topLeftTextStyle
        
        switch state {
        case .normal:
            topRightLabel.style_ = style_.topRightTextStyleNormal
        case .accent:
            topRightLabel.style_ = style_.topRightTextStyleAccent
        case .idle:
            topRightLabel.style_ = style_.topRightTextStyleIdle
        }
    }
}
