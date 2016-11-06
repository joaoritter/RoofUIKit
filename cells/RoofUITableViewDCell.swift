//
//  RoofUITableViewDCell.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 6/18/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class RoofUITableViewDCell: RoofUITableViewCell {
    
    //MARK: public vars
    lazy var topLeftLabel: RoofUILabel = {
        let label = RoofUILabel()
        
        /// Set immutable properties.
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let topRightLabel = RoofUILabel()
   
    lazy var bottomLeftLabel: RoofUILabel = {
        let label = RoofUILabel()
        
        /// Set immutable properties.
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
    var iconImage: UIImage? {
        get {
            return icon.image
        }
        set {
            icon.image = newValue?.withRenderingMode(.alwaysTemplate)
            ///Updates image width.
            setNeedsUpdateConstraints()
        }
    }
    
    
    //MARK: private vars
    lazy private var icon: UIImageView = {
        
        /// Set immutable properties.
        let icon = UIImageView(image: UIImage(named: "chevron")?.withRenderingMode(.alwaysTemplate))
        
        icon.contentMode = .scaleAspectFit
        icon.tintColor = roofUINeutralDColor
        
        return icon
        
    }()
    private let verticalPadding: CGFloat = roofUIMarginA
    private let verticalBottomPadding: CGFloat = roofUIMarginC
    private let verticalMargins: CGFloat = 4

    private let iconSize: CGFloat = roofUIIconSizeSmall
    
    
    //MARK: public funcs

    override func addSubviews() {
        super.addSubviews()
        
        ///Add the labels.
        contentView.addSubview(topLeftLabel)
        contentView.addSubview(topRightLabel)
        contentView.addSubview(bottomLeftLabel)
        contentView.addSubview(icon)
    }
    
    override func makeConstraints() {
        topLeftLabel.snp.remakeConstraints {
            (make) -> Void in
            make.left.equalTo(icon.snp.right).offset(horizontalPadding)
            make.top.equalTo(self.contentView).offset(verticalPadding)
            make.right.lessThanOrEqualTo(topRightLabel.snp.left).offset(-horizontalPadding)
        }
        topRightLabel.snp.remakeConstraints {
            (make) -> Void in
            make.right.equalTo(self.contentView).offset(-horizontalPadding)
            make.top.equalTo(topLeftLabel)
        }
        
        bottomLeftLabel.snp.remakeConstraints {
            (make) -> Void in
            make.left.equalTo(icon.snp.right).offset(horizontalPadding)
            make.right.equalTo(self.contentView).offset(-horizontalPadding)
            make.top.equalTo(topLeftLabel.snp.bottom).offset(verticalMargins)
            make.bottom.equalTo(self.contentView).offset(-verticalBottomPadding)
        }
        icon.snp.remakeConstraints {
            (make) -> Void in
            
            make.top.equalTo(self.contentView).offset(verticalPadding)
            make.left.equalTo(contentView).offset(horizontalPadding)
            make.size.equalTo(iconSize)
        }
        super.makeConstraints()
    }

    /// Sets the weights of the string.
    func setAttributedTopLeftTextToString(string: String, andThinRanges ranges: [NSRange]) {
        guard let style_ = style_ as? RoofUITableViewCellDetailStyle else { return }
        
        let normalAttributes = [
            NSFontAttributeName: style_.topLeftTextStyle.font ?? UIFont.systemFont(ofSize: 14),
            NSForegroundColorAttributeName: style_.topLeftTextStyle.textColor ?? UIColor.black
        ]
        let attributedString = NSMutableAttributedString(
            string: string,
            attributes: normalAttributes
        )
        
        for range in ranges {
            let boldAttributes = [
                NSFontAttributeName: style_.topLeftThinTextStyle.font ?? UIFont.systemFont(ofSize: 14),
                NSForegroundColorAttributeName: style_.topLeftThinTextStyle.textColor ?? UIColor.black
            ]
            attributedString.setAttributes(boldAttributes, range: range)
        }
        self.topLeftLabel.attributedText = attributedString
    }
    
    /// Sets mutable properties based on the set style
    override func updateStyle() {
        super.updateStyle()
        
        ///There must be a style.
        guard let style_ = style_ as? RoofUITableViewCellDetailStyle else { return }
        
        bottomLeftLabel.style_ = style_.bottomLeftTextStyle
        
        switch state {
        case .normal:
            topRightLabel.style_ = style_.topRightTextStyleNormal
        case .accent:
            topRightLabel.style_ = style_.topRightTextStyleAccent
        case .idle:
            topRightLabel.style_ = style_.topRightTextStyleIdle
        }
        
        bottomLeftLabel.style_ = style_.bottomLeftTextStyle
    }
}
