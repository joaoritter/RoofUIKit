//
//  RoofUITableViewBCell.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 10/7/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit

///Autolayout library.
import SnapKit

class RoofUITableViewBCell: RoofUITableViewCell {
    
    //MARK: public vars
    lazy var titleLabel: RoofUILabel = {
        let titleLabel = RoofUILabel()
        
        /// Set immutable properties.
        titleLabel.numberOfLines = 1
        titleLabel.adjustsFontSizeToFitWidth = true
        
        return titleLabel
    }()
    
    lazy var statusLabel: RoofUILabel = {
        let statusLabel = RoofUILabel()
        
        /// Set immutable properties.
        statusLabel.numberOfLines = 1
        statusLabel.adjustsFontSizeToFitWidth = false
        
        return statusLabel
    }()

    
    //MARK: private vars
    private let verticalPadding: CGFloat = roofUIMarginB
        
    //MARK: public funcs
    
    override func addSubviews() {
        super.addSubviews()
        
        ///Add the labels.
        contentView.addSubview(titleLabel)
        contentView.addSubview(statusLabel)
    }
    
    override func makeConstraints() {

        titleLabel.snp.remakeConstraints {
            (make) -> Void in
            make.left.equalTo(self.contentView).offset(horizontalPadding)
            make.centerY.equalTo(self.contentView)
            make.top.equalTo(self.contentView).offset(verticalPadding)
            make.right.lessThanOrEqualTo(statusLabel.snp.left).offset(-horizontalPadding)
        }
        
        statusLabel.snp.remakeConstraints {
            (make) -> Void in
            make.right.equalTo(self.contentView).offset(-horizontalPadding)
            make.centerY.equalTo(titleLabel)
        }
        
        super.makeConstraints()
    }
    
    /// Sets mutable properties based on the set style
    override func updateStyle() {
        super.updateStyle()
        
        ///There must be a style.
        guard let style_ = style_ as? RoofUITableViewCellStatusStyle else { return }
        
        switch state {
        case .normal:
            statusLabel.style_ = style_.statusTextStyleNormal
            titleLabel.style_ = style_.titleTextStyleNormal
            contentView.backgroundColor = style_.backgroundColor
        case .accent:
            statusLabel.style_ = style_.statusTextStyleAccent
            titleLabel.style_ = style_.titleTextStyleAccent
            contentView.backgroundColor = style_.backgroundColorAccent
        case .idle:
            statusLabel.style_ = style_.statusTextStyleIdle
            titleLabel.style_ = style_.titleTextStyleIdle
            contentView.backgroundColor = style_.backgroundColorIdle
        }
    }
}
