//
//  RoofUIButtonTableHeader.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 7/1/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit

///Autolayout utility.
import SnapKit

///The view for a button table section header.
class RoofUIButtonTableHeaderFooterView: UITableViewHeaderFooterView {
    
    //MARK: public vars
    
    var style_: RoofUITableHeaderFooterViewStyle? {
        didSet {
            updateStyle()
        }
    }

    lazy var button: RoofUIButtonView = {
        let button = RoofUIButtonView()
        button.addTarget(
            self,
            action: #selector(didTapButton),
            for: .touchUpInside
        )
        return button
    }()

    weak var delegate: RoofUIButtonTableHeaderFooterViewDelegate?
    
    
    //MARK: private vars
    
    ///The cells top padding.
    private let verticalPaddingTop = roofUIMarginC
    private let verticalPaddingBottom = 0
    private let horizontalPadding: CGFloat = roofUIMarginC
    
    private let maxButtonWidth = roofUIMaxButtonWidth
    private let buttonHeight = roofUIButtonHeight

    
    //MARK: public funcs
    
    override func addSubviews() {
        super.addSubviews()
        
        ///Add the labels.
        contentView.addSubview(button)
    }
    
    override func makeConstraints() {
        button.snp.remakeConstraints {
            (make) -> Void in
            make.top.equalTo(self.contentView).offset(verticalPaddingTop).priority(roofUILayoutPriorityHigh)
            make.width.equalTo(self).offset(-2*horizontalPadding).priority(roofUILayoutPriorityHigh)

            make.centerX.equalTo(self.contentView)
            
            make.bottom.equalTo(self.contentView).offset(-verticalPaddingBottom).priority(roofUILayoutPriorityHigh)
        }

        super.makeConstraints()
    }
    
    /// The function to run when a button is tapped.
    func didTapButton(_ button: RoofUIButtonView) {
        if button == self.button {
            delegate?.didTapButtonAtIndex(
                1,
                inButtonTableHeaderFooterView: self
            )
        }
    }


    
    //MARK: private funcs
    
    /// Sets mutable properties based on the set style
    private func updateStyle() {
        
        ///There must be a style.
        guard let style_ = style_ else { return }
        
        contentView.backgroundColor = style_.backgroundColor
     
        button.style_ = style_.buttonStyle
    }
}
