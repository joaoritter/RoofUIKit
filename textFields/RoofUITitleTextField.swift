//
//  RoofUITextFieldBig.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 7/25/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit

///A text field that can adapt to styles.
class RoofUITitleTextField: RoofUITextField {
    
    ///MARK: public vars
    
    ///The current style.
    override var style_: RoofUITextFieldStyle? {
        didSet {
//            updateStyle()
            label.sizeToFit()
        }
    }
    
    ///The text of the label.
    var title: String? {
        get {
            return label.text
        }
        set {
            label.text = newValue
            label.sizeToFit()
        }
    }
    
     ///MARK: private vars
    
    private let label = RoofUILabel()
    
    
    ///MARK: public funcs
    
    override func setup() {
        super.setup()
        leftView = label
        leftViewMode = .always
        label.lineBreakMode = .byClipping
    }
    
    /// Sets mutable properties based on the set style
    override func updateStyle() {
        
        super.updateStyle()
        
        guard let style__ = style_ as? RoofUITitleTextFieldStyle else { return }
        label.style_ = style__.labelStyle
    }
}
