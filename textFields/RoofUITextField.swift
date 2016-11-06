//
//  RoofUITextField.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 5/29/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit

///A text field that can adapt to styles.
class RoofUITextField: UITextField {
    
    ///MARK: public vars
    
    ///The current style.
    var style_: RoofUITextFieldStyle? {
        didSet {
            updateStyle()
        }
    }

    ///The text field type.
    var type: RoofUITextFieldType = .text

    ///The accessory view delegate.
    weak var accessoryViewDelegate: RoofUIKeyboardAccessoryViewDelegate?
        
    ///MARK: private vars
    
    private let accessoryView = RoofUIKeyboardAccessoryView()
    
    ///The text for the form submit cta
    var ctaText: String? {
        didSet {
            guard let ctaText = ctaText, ctaText != oldValue else { return }
            
            accessoryView.rightButtonState = .submit(title: ctaText)
        }
    }
    
    //MARK: init
    
    init(style: RoofUITextFieldStyle? = nil) {
        self.style_ = style
        super.init(frame: CGRect.zero)
    }
    
    /// Unused but required.
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    ///MARK: public funcs
    
    override func setup() {
        super.setup()
        updateStyle()
        setupAccessoryViewButtons()
        accessoryView.setup()
        
        clearButtonMode = .whileEditing
        inputAccessoryView = accessoryView
        adjustsFontSizeToFitWidth = true
        minimumFontSize = roofUIMinimumScaleFactor
    }
    
    /// Hides the keyboard
    func didTapLeftButtonOfAccessoryView() {
        accessoryViewDelegate?.didTapLeftButtonOfRoofUIKeyboardAccessoryViewInTextField?(textField: self)
    }
    
    /// Proceeds according to the delegate.
    func didTapRightButtonOfAccessoryView() {
        accessoryViewDelegate?.didTapRightButtonOfRoofUIKeyboardAccessoryViewInTextField?(textField: self)
    }
    
    /// Sets mutable properties based on the set style
    func updateStyle() {
        
        ///There must be a style.
        guard let style_ = style_ else { return }
        
        ///Set the font.
        font = style_.font
        
        ///Set the text color.
        textColor = style_.textColor
        
        accessoryView.style_ = style_.accessoryViewStyle
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [
                NSForegroundColorAttributeName: style_.placeholderStyle?.textColor ?? UIColor.black,
                NSFontAttributeName: style_.placeholderStyle?.font ?? UIFont.systemFont(ofSize: 14)
            ]
        )
    }
    
    
    ///MARK: private funcs

    /// Sets up the accessory view buttons
    private func setupAccessoryViewButtons() {
        accessoryView.rightButton.addTarget(
            self,
            action: #selector(didTapRightButtonOfAccessoryView),
            for: .touchUpInside
        )
        
        accessoryView.leftButton.addTarget(
            self,
            action: #selector(didTapLeftButtonOfAccessoryView),
            for: .touchUpInside
        )
    }
}
