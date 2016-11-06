//
//  RoofUITextView.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 5/22/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit

///A text view that can adapt to styles.
class RoofUITextView: UITextView {
    
    ///MARK: public vars
    
    ///The current style of the view.
    var style_: RoofUITextStyle? {
        didSet {
            updateStyle()
        }
    }
    
    
    /// The style of subtext.
    var subtextStyle_: RoofUITextStyle? {
        didSet {
            updateStyle()
        }
    }
    
    /// The string in the text view.
    override var text: String? {
        didSet {
            updateStyle()
        }
    }

    /// The range of the sub text.
    var subtext: String? {
        didSet {
            updateStyle()
        }
    }

    
    //MARK: init
    
    init() {
        super.init(
            frame: CGRect.zero,
            textContainer: nil
        )
    }
    
    /// Unused but required.

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    ///MARK: public funcs
    override func setup() {
        super.setup()
        updateStyle()
        
        /// TODO: find work around for clipping. 
        clipsToBounds = false
    }
    
    /// Sets mutable properties based on the set style

    private func updateStyle() {
        
        ///There must be a style.
        guard let style_ = style_,
            let text = text else { return }
        
        let font = style_.font ?? UIFont.systemFont(ofSize: 14)
        let textColor = style_.textColor

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = textAlignment
        paragraphStyle.lineBreakMode = .byWordWrapping
        
        let attributedString = NSMutableAttributedString(
            string: text,
            attributes: [
                NSFontAttributeName: font,
                NSForegroundColorAttributeName: textColor ?? UIColor.black,
                NSParagraphStyleAttributeName: paragraphStyle
            ]
        )
        
        ///If a subtext style isn't specified, use the normal style.
        if let subtext = subtext {
            
            let subtextStyle = subtextStyle_ ?? style_
            
            let subtextRange = (text as NSString).range(of: subtext)
            
            let subtextFont = subtextStyle.font ?? UIFont.systemFont(ofSize: 14)
            let subtextTextColor = subtextStyle.textColor
            
            attributedString.addAttributes(
                [
                    NSForegroundColorAttributeName: subtextTextColor ?? UIColor.black,
                    NSFontAttributeName: subtextFont
                ],
                range: subtextRange
            )
        }
        
        attributedText = attributedString
    }
}
