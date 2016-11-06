//
//  RoofUITableSectionHeaderDescription.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 10/8/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit

///Autolayout utility.
import SnapKit

///The view for a table section header with a large description.
class RoofUITableSectionHeaderDescriptionView: UITableViewHeaderFooterView {
    
    //MARK: public vars
    
    var style_: RoofUITableSectionHeaderViewStyle? {
        didSet {
            updateStyle()
        }
    }
    
    let titleLabel = RoofUILabel()
    let secondaryLabel = RoofUILabel()
    
    //MARK: private vars
    
    ///The cells right and bottom padding.
    private let verticalPadding: CGFloat = roofUIMarginD
    private let betweenVerticalPadding: CGFloat = roofUIMarginC

    private let horizontalPadding: CGFloat = roofUIMarginD
    
    //MARK: public funcs
    
    override func addSubviews() {
        super.addSubviews()
        
        ///Add the labels.
        contentView.addSubview(titleLabel)
        contentView.addSubview(secondaryLabel)
    }
    
    override func makeConstraints() {
        
        titleLabel.snp.remakeConstraints {
            (make) -> Void in
            make.left.equalTo(self.contentView).offset(horizontalPadding).priority(roofUILayoutPriorityHigh)
            make.top.equalTo(self.contentView).offset(verticalPadding).priority(roofUILayoutPriorityHigh)
            make.right.equalTo(self.contentView).offset(-horizontalPadding).priority(roofUILayoutPriorityHigh)
        }
        secondaryLabel.snp.remakeConstraints {
            (make) -> Void in
            make.top.equalTo(titleLabel.snp.bottom).offset(betweenVerticalPadding).priority(roofUILayoutPriorityHigh)
            make.bottom.equalTo(self.contentView).offset(-verticalPadding).priority(roofUILayoutPriorityHigh)
            make.centerX.equalTo(self.contentView)
        }
        super.makeConstraints()
    }
    
    override func setup() {
        super.setup()
        setupTitleLabel()
        setupSecondaryLabel()
    }
    
    
    //MARK: private funcs
    
    /// Sets mutable properties based on the set style
    private func updateStyle() {
        
        ///There must be a style.
        guard let style_ = style_ else { return }
        
        contentView.backgroundColor = style_.backgroundColor
        titleLabel.style_ = style_.headerStyle
        secondaryLabel.style_ = style_.detailStyle
        
        secondaryLabel.textAlignment = style_.textAlignment
    }
    
    private func setupTitleLabel() {
        titleLabel.numberOfLines = 1
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.minimumScaleFactor = roofUIMinimumScaleFactor
        titleLabel.textAlignment = .center
    }
    
    private func setupSecondaryLabel() {
        secondaryLabel.numberOfLines = 0
        secondaryLabel.lineBreakMode = .byWordWrapping
    }
}
