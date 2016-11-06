//
//  RoofUIKeyboardAccessoryView.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 6/13/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit

///A view above the keyboard.
class RoofUIKeyboardAccessoryView: UIView {
    
    /// MARK: public vars
    
    /// The current style of the view.
    var style_: RoofUIKeyboardAccessoryStyle? {
        didSet {
            updateStyle()
        }
    }
    
    /// The button on the left.
    lazy var leftButton: UIButton = {
        let button = UIButton()
        
        ///Set immutable properties.
        button.backgroundColor = nil
        button.setTitle(
            "hide",
            for: UIControlState()
        )
        
        return button
    }()
    
    /// The button on the right.
    lazy var rightButton: UIButton = {
        let button =  UIButton()
        button.backgroundColor = nil
        button.setTitle(
            self.rightButtonState.title,
            for: UIControlState()
        )
        
        return button
    }()

    /// The state of the right button. This depends on the keyboard's environment.
    var rightButtonState: RoofUIKeyboardAccessoryState = .next {
        didSet {
            rightButton.setTitle(
                rightButtonState.title,
                for: UIControlState()
            )
        }
    }
    
    ///MARK: private vars
    
    /// The border between the buttons.
    private let dividerView = UIView()
    
    /// The width of the border.
    private let dividerWidth: CGFloat = 1
    
    // /The height of the accessory view.
    private let height: CGFloat = roofUIKeyboardAccessoryHeight
    
    
    //MARK: init
    
    init(style: RoofUIKeyboardAccessoryStyle? = RoofUIKeyboardAccessoryStyleBlue()) {
        self.style_ = style
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: height))
    }
    
    /// Unused but required.
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    /// MARK: public funcs
    
    override func addSubviews() {
        super.addSubviews()
        
        addSubview(leftButton)
        addSubview(rightButton)
        addSubview(dividerView)
    }
    
    override func makeConstraints() {
        
        leftButton.snp.remakeConstraints {
            (make) -> Void in
            
            make.left.equalTo(self)
            make.right.equalTo(dividerView.snp.left)
            make.top.equalTo(self)
            make.bottom.equalTo(self)
        }

        rightButton.snp.remakeConstraints {
            (make) -> Void in
            
            make.right.equalTo(self)
            make.left.equalTo(dividerView.snp.right)
            make.top.equalTo(self)
            make.bottom.equalTo(self)
        }
        
        dividerView.snp.remakeConstraints {
            (make) -> Void in
            make.top.equalTo(self)
            make.bottom.equalTo(self)
            make.centerX.equalTo(self)
            make.width.equalTo(dividerWidth)
        }
        
        super.makeConstraints()
    }

    /// Sets mutable properties based on the set style
    func updateStyle() {
        
        ///There must be a style.
        guard let style_ = style_ else { return }
        
        backgroundColor = style_.backgroundColor
        dividerView.backgroundColor = style_.dividerColor
        
        leftButton.titleLabel?.font = style_.titleStyle.font
        leftButton.setTitleColor(
            style_.titleStyle.textColor,
            for: UIControlState()
        )
        
        rightButton.titleLabel?.font = style_.titleStyle.font
        rightButton.setTitleColor(
            style_.titleStyle.textColor,
            for: UIControlState()
        )
        
        layer.shadowColor = style_.shadowColor?.cgColor ?? nil
        layer.shadowRadius = style_.shadowRadius ?? 0
        layer.shadowOpacity = style_.shadowOpacity ?? 0
        layer.shadowOffset = style_.shadowOffset ?? CGSize.zero
    }
}
