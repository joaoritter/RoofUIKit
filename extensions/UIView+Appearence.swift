//
//  RoofUIView.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 4/23/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit

///Adds setup functionality to a UIView.
extension UIView {

    //MARK: public funcs
    
    /// Put view setup code that can't be computed lazily here.
    func setup() {
        
        ///Once setup is called, all views should be in the heirchy.
        addSubviews()
        
        ///After adding all views to the heirchy, make the view's constraints.
        makeConstraints()
        
        ///Setup each subview.
        setupSubviews()
    }
    
    /// Add subviews to this view here.
    func addSubviews() {}
    
    
    /// Makes the view's constraints.
    func makeConstraints(){}
    
    /// For debugging.
    func addTestingBorder(color: UIColor = UIColor.black) {
        layer.borderColor = color.cgColor
        layer.borderWidth = 1
    }
    
    
    /// Fades in a view that is hidden or with 0 alpha.
    func showAnimated(animated: Bool, completion: ((Bool) -> Void)? = nil) {
        guard alpha != 1 || isHidden else { return }
        
        if isHidden {
            alpha = 0
        }
        isHidden = false
        UIView.animate(
            withDuration: animated ? roofUITimeIntervalShort : 0,
            animations: {
                self.alpha = 1
            },
            completion: completion
        )
    }
    
    //MARK: private funcs

    /// Setup each of this view's subviews.
    private func setupSubviews() {
        subviews.forEach { $0.setup() }
    }
}
