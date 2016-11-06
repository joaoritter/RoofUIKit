//
//  RoofUITableSectionHeaderView.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 5/5/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

///The view for a table section header.
class RoofUITableSectionHeaderView: UITableViewHeaderFooterView {
    
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
    private let verticalPadding: CGFloat = roofUIMargin0
    private var verticalTopPadding: CGFloat {
        return roofUIMargin0
    }

    private let horizontalPadding: CGFloat = roofUIMarginA

    //MARK: public funcs
    
    override func addSubviews() {
        super.addSubviews()
        
        ///Add the labels.
        contentView.addSubview(titleLabel)
        contentView.addSubview(secondaryLabel)

        //TODO
        titleLabel.text = " "
    }
    
    override func makeConstraints() {

        titleLabel.snp.remakeConstraints {
            (make) -> Void in
            make.bottom.equalTo(self.contentView).offset(-verticalPadding).priority(roofUILayoutPriorityHigh)
            make.left.equalTo(self.contentView).offset(horizontalPadding).priority(roofUILayoutPriorityHigh)
            make.top.equalTo(self.contentView).offset(verticalTopPadding).priority(roofUILayoutPriorityHigh)
            make.right.equalTo(self.contentView).offset(-horizontalPadding).priority(roofUILayoutPriorityHigh)
        }
        secondaryLabel.snp.remakeConstraints {
            (make) -> Void in
            make.bottom.equalTo(self.contentView).offset(-verticalPadding).priority(roofUILayoutPriorityHigh)
            make.right.equalTo(self.contentView).offset(-horizontalPadding).priority(roofUILayoutPriorityHigh)
            make.left.greaterThanOrEqualTo(titleLabel.snp.right).offset(horizontalPadding).priority(roofUILayoutPriorityHigh)
        }
        super.makeConstraints()
    }

    //MARK: private funcs

    /// Sets mutable properties based on the set style
    private func updateStyle() {
        
        ///There must be a style.
        guard let style_ = style_ else { return }
        
        contentView.backgroundColor = style_.backgroundColor
        titleLabel.textAlignment = style_.textAlignment
        titleLabel.style_ = style_.headerStyle
        secondaryLabel.style_ = style_.detailStyle        
    }
}
