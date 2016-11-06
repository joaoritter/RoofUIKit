//
//  RoofUIButtonsView.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 5/21/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

///A view containing buttons.
class RoofUIButtonsView: UIView {
    
    //MARK: public vars

    ///The buttons.
    var buttons: [RoofUIButtonView] = [] {
        didSet {
            for button in oldValue {
                button.snp.removeConstraints()
                button.removeFromSuperview()
            }
            
            setup()
        }
    }

    //MARK: private vars
    private let buttonMargin: CGFloat = roofUIMarginA

    //MARK: public funcs
    override func addSubviews() {
        super.addSubviews()
        
        for button in buttons {
            addSubview(button)
        }
    }
    
    override func makeConstraints() {
        for (index, button) in buttons.enumerated() {
          
            button.snp.remakeConstraints {
                (make) -> Void in
                
                make.centerX.equalTo(self)
                
                make.width.equalTo(self).priority(roofUILayoutPriorityHigh)
                
                ///If its the first button, constrain to the bottom of the container.
                if index == 0 {
                    make.bottom.equalTo(self)
                }
                
                ///If not the first button, constrain to the previous button.
                else {
                    let buttonAbove = buttons[index - 1]
                    make.bottom.equalTo(buttonAbove.snp.top).offset(-buttonMargin)
                }
                
                ///If its the last button, constrain to the top of the container.
                if index == buttons.count - 1 {
                    make.top.equalTo(self)
                }
            }
        }
        
        super.makeConstraints()
    }
}
