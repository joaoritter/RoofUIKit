//
//  RoofUITableViewCCell.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 6/7/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit

///Autolayout library.
import SnapKit

class RoofUITableViewCCell: RoofUITableViewCell {
    
    //MARK: public vars
    let label = RoofUILabel()
    lazy var sideImageView: UIImageView = {
        let imageView = UIImageView()
        
        let sideImage: UIImage? = UIImage(named: "chevron")?.withRenderingMode(.alwaysTemplate)
        
        imageView.image = sideImage
        
        return imageView
    }()


    //MARK: private vars
    
    private let verticalPadding: CGFloat = roofUIMarginC
    private let imageSize: CGFloat = roofUIIconSize

    
    //MARK: public funcs
    
    override func addSubviews() {
        super.addSubviews()
        
        ///Add the labels.
        contentView.addSubview(label)
        contentView.addSubview(sideImageView)
    }
    
    override func makeConstraints() {

        label.snp.remakeConstraints {
            (make) -> Void in
            make.top.equalTo(self.contentView).offset(verticalPadding)
            make.bottom.equalTo(self.contentView).offset(-verticalPadding)
            make.left.equalTo(self.contentView).offset(horizontalPadding)
            make.right.lessThanOrEqualTo(sideImageView.snp.left).offset(-horizontalPadding)
        }
        
        sideImageView.snp.remakeConstraints {
            (make) -> Void in
            
            make.centerY.equalTo(label)
            make.right.equalTo(contentView).offset(-horizontalPadding)
            make.size.equalTo(imageSize)
        }
        
        super.makeConstraints()
    }
    
    /// Sets the weights of the string.
    func setAttributedLabelTextToString(_ string: String, andThinRanges ranges: [NSRange]) {
        guard let style_ = style_ as? RoofUITableViewCellSegueStyle else { return }
        
        var labelStyle: RoofUITextStyle
        var labelThinStyle: RoofUITextStyle
        switch state {
        case .normal:
            labelStyle = style_.labelTextStyleNormal
            labelThinStyle = style_.labelTextThinStyleNormal
        case .accent:
            labelStyle = style_.labelTextStyleAccent
            labelThinStyle = style_.labelTextThinStyleNormal
        case .idle:
            labelStyle = style_.labelTextStyleIdle
            labelThinStyle = style_.labelTextThinStyleNormal
        }
        let normalAttributes = [
            NSFontAttributeName: labelStyle.font ?? UIFont.systemFont(ofSize: 14),
            NSForegroundColorAttributeName: labelStyle.textColor ?? UIColor.black
        ]
        let attributedString = NSMutableAttributedString(
            string: string,
            attributes: normalAttributes
        )
        
        for range in ranges {
            let boldAttributes = [
                NSFontAttributeName: labelThinStyle.font ?? UIFont.systemFont(ofSize: 14),
                NSForegroundColorAttributeName: labelThinStyle.textColor ?? UIColor.black
            ]
            attributedString.setAttributes(boldAttributes, range: range)
        }
        self.label.attributedText = attributedString
    }
    
    /// Sets mutable properties based on the set style
    override func updateStyle() {
        
        super.updateStyle()
        
        ///There must be a style.
        guard let style_ = style_ as? RoofUITableViewCellSegueStyle else { return }
        
        label.textAlignment = style_.alignment
        
        switch state {
        case .normal:
            contentView.backgroundColor = style_.backgroundColor
            sideImageView.tintColor = style_.labelTextStyleNormal.textColor
        case .accent:
            contentView.backgroundColor = style_.backgroundColorAccent
            sideImageView.tintColor = style_.labelTextStyleAccent.textColor
        case .idle:
            contentView.backgroundColor = style_.backgroundColorIdle
            sideImageView.tintColor = style_.labelTextStyleIdle.textColor
        }
    }
}
