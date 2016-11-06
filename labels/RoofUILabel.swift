//
//  RoofUILabel.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 5/5/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit

import Spring

///A label that can adapt to styles.
class RoofUILabel: SpringLabel {
    
    ///MARK: public vars

    ///The current style.
    var style_: RoofUITextStyle? {
        didSet {
            updateStyle()
        }
    }
    
    ///MARK: private funcs
    
    /// Sets mutable properties based on the set style
    private func updateStyle() {
        
        ///There must be a style.
        guard let style_ = style_ else { return }
        
        ///Set the font.
        font = style_.font
        
        ///Set the text color.
        textColor = style_.textColor
    }
}
