//
//  RoofUITableViewCell.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 10/20/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import Former

class RoofUITableViewCell: UITableViewCell, FormableRow {

    //MARK: public vars
    
    ///The current style of the view.
    var style_: RoofUITableViewCellStyle? {
        didSet {
            updateStyle()
        }
    }
    
    ///If this is the first cell in the former.
    var hiddenSeparator: Bool = false {
        didSet {
            seperator.isHidden = hiddenSeparator
        }
    }
    
    
    ///If the top seperator should be hidden.
    var hiddenTopSeperator: Bool = true {
        didSet {
            topSeperator.isHidden = hiddenTopSeperator
        }
    }
    
    ///The state that influences the style.
    var state: RoofUICellState = .normal {
        didSet {
            updateStyle()
        }
    }
    
    let horizontalPadding: CGFloat = roofUIMarginA

    //MARK: private vars
    
    private let seperator = UIView()
    lazy private var topSeperator: UIView = {
        let topSeperator = UIView()
        
        topSeperator.isHidden = self.hiddenTopSeperator

        return topSeperator
    }()
    private let tapAlpha: CGFloat = roofUIStandardTapAlpha
    private let topSeperatorHeight: CGFloat = 0.4
    private let seperatorHeight: CGFloat = 0.5
    private var defaultTapBackgroundColor: UIColor? {
        return style_?.seperatorColor ?? roofUINeutralCColor
    }

    //MARK: public funcs
    
    override func addSubviews() {
        super.addSubviews()
        
        contentView.addSubview(topSeperator)
        contentView.addSubview(seperator)
    }
    
    override func makeConstraints() {
        seperator.snp.remakeConstraints {
            (make) -> Void in
            
            make.bottom.equalTo(contentView)
            make.left.equalTo(contentView).offset(horizontalPadding)
            make.right.equalTo(contentView)
            make.height.equalTo(seperatorHeight)
        }
        
        topSeperator.snp.remakeConstraints {
            (make) -> Void in
            
            make.top.equalTo(contentView)
            make.left.equalTo(contentView)
            make.right.equalTo(contentView)
            make.height.equalTo(topSeperatorHeight)
        }
        
        super.makeConstraints()
    }
    
    override func setup() {
        super.setup()
        
        ///No default change of style when the cell is selected.
        selectionStyle = .none
        backgroundColor = nil        
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        highlighted ? setHighlighted() : restoreBackground()
    }

    ///unused but required by protocol
    func updateWithRowFormer(_ rowFormer: RowFormer){}
    
    /// Sets mutable properties based on the set style
    func updateStyle() {
        
        ///There must be a style.
        guard let style_ = style_ else { return }
        
        contentView.backgroundColor = style_.backgroundColor
        seperator.backgroundColor = style_.seperatorColor
        topSeperator.backgroundColor = style_.seperatorColor
    }
    
    //MARK: private funcs
    
    /// Runs when the button is tapped.
    private func setHighlighted() {
        if contentView.backgroundColor == nil || contentView.backgroundColor == roofUINeutralAColor {
            contentView.backgroundColor = defaultTapBackgroundColor
        }
        else {
            contentView.backgroundColor = contentView.backgroundColor?.withAlphaComponent(tapAlpha)
        }
    }
    
    /// Runs when the button is finished being tapped.
    private func restoreBackground() {
        guard let style_ = style_ else { return }
        contentView.backgroundColor = style_.backgroundColor
    }
}
