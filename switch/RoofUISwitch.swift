//
//  RoofUISwitch.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 7/11/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit

///A switch view in a form.
class RoofUISwitch: UISwitch {
    
    // MARK: public vars
    
    /// The current style of the switch.
    var style_: RoofUISwitchStyle? {
        didSet {
            updateStyle()
        }
    }
    
    // MARK: private funcs
    
    /// Sets mutable button properties based on the set style
    private func updateStyle() {
        
        ///There must be a style.
        guard let style_ = style_ else { return }
        
        tintColor = style_.offTint
        onTintColor = style_.onTint
        thumbTintColor = style_.indicatorBackgroundColor
    }
}
