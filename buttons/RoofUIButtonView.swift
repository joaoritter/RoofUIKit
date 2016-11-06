//
// RoofUIButtonView.swift
// Roof
//
// Created by João Victor de Souza Ritter on 5/9/16.
// Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit

///A button with an optional alert message.
class RoofUIButtonView: UIButton {
    
    //MARK: public vars
    ///The button's style.
    var style_: RoofUIButtonStyle? {
        didSet {
            updateStyle()
        }
    }
    
    ///The label for the main text.
    lazy var primaryLabel: RoofUILabel = {
        let primaryLabel = RoofUILabel()
        
        /// Set immutable properties
        primaryLabel.numberOfLines = 1
        primaryLabel.textAlignment = .center
        primaryLabel.adjustsFontSizeToFitWidth = true
        primaryLabel.minimumScaleFactor = roofUIMinimumScaleFactor
        
        return primaryLabel
    }()
    
    //MARK: private vars
    
    private let horizontalPadding = roofUIMarginC
    private let cornerRadius: CGFloat = roofUICornerRadius
    private let tapAlpha: CGFloat = roofUIStandardTapAlpha
    private let borderWidth: CGFloat = 2
    private let verticalPadding: CGFloat = roofUIMarginB

    
    //MARK: init
    
    //MARK: public funcs
    override func setup() {
        super.setup()
        updateStyle()
        
        addButtonTargets()
        layer.cornerRadius = cornerRadius
    }
    
    override func addSubviews() {
        super.addSubviews()
        addSubview(primaryLabel)
    }
    
    override func makeConstraints() {

        primaryLabel.snp.remakeConstraints {
            (make) -> Void in
            
            ///Prioritize subtitle's margin top.
            make.top.equalTo(self).offset(verticalPadding)
            make.bottom.equalTo(self).offset(-verticalPadding)
            make.centerX.equalTo(self)
            make.left.greaterThanOrEqualTo(self).offset(horizontalPadding)
            make.right.lessThanOrEqualTo(self).offset(-horizontalPadding)
        }

        super.makeConstraints()
    }
    
    
    /// Runs when the button is tapped.
    func tapStart() {
        if backgroundColor == nil || backgroundColor == roofUINeutralAColor {
            primaryLabel.textColor = primaryLabel.textColor?.withAlphaComponent(tapAlpha)
            if let borderColor = layer.borderColor {
                layer.borderColor = UIColor(cgColor: borderColor).withAlphaComponent(tapAlpha).cgColor
            }
        }
        else {
            backgroundColor = backgroundColor?.withAlphaComponent(tapAlpha)
        }
    }
    
    ///Runs when the button is finished being tapped.
    func tapFinish() {
        backgroundColor = backgroundColor?.withAlphaComponent(1)
        if let borderColor = layer.borderColor {
            layer.borderColor = UIColor(cgColor: borderColor).withAlphaComponent(1).cgColor
        }
        primaryLabel.textColor = primaryLabel.textColor?.withAlphaComponent(1)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.next?.touchesBegan(touches, with: event)
    }
    
    
    //MARK: private funcs
    
    /// Sets mutable properties based on the set style
    private func updateStyle() {
        
        ///There must be a style.
        guard let style_ = style_ else { return }
        
        backgroundColor = style_.backgroundColor
        if let borderColor = style_.borderColor, style_.buttonType == .action {
            layer.borderColor = borderColor.cgColor
            layer.borderWidth = borderWidth
        }
        else {
            layer.borderWidth = 0
        }

        primaryLabel.style_ = style_.titleTextStyle
    }
    
    
    ///Adds the button targets
    private func addButtonTargets() {
        addTarget(
            self,
            action: #selector(tapStart),
            for: UIControlEvents.touchDown
        )
        
        addTarget(
            self,
            action: #selector(tapFinish),
            for: UIControlEvents.touchUpInside
        )
        
        addTarget(
            self,
            action: #selector(tapFinish),
            for: UIControlEvents.touchUpOutside
        )
        
        addTarget(
            self,
            action: #selector(tapFinish),
            for: UIControlEvents.touchCancel
        )
    }
}
