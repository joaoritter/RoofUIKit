//
//  RoofUITableView.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 4/23/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit

///Pull to refresh utility.
//import PullToRefreshSwift

class RoofUITableView: UITableView {
    
    ///MARK: public vars

    ///Cannot change a table's style.
    var style_: RoofUITableViewStyle? {
        didSet {
            updateStyle()
        }
    }
        
    override var dataSource: UITableViewDataSource? {
        didSet {
            guard dataSource !== oldValue else { return }
            reloadData()
        }
    }

    ///MARK: private vars
    
    ///Fixed properties characteristic to this subclass.
    private let bottomInset = roofUIMarginE

    //MARK: init
    
    /// Initializes a table view.
    init(frame: CGRect = CGRect.zero, style: RoofUITableViewStyle? = nil) {
        self.style_ = style
        super.init(
            frame: frame,
            style: style?.tableStyle ?? UITableViewStyle.grouped
        )
    }
    
    /// Unused, but required.
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    //MARK: public funcs

    override func setup() {
        super.setup()
        separatorStyle = .none
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        contentInset = UIEdgeInsets(
            top: 0,
            left: 0,
            bottom: bottomInset,
            right: 0
        )
        
        rowHeight = UITableViewAutomaticDimension
        sectionHeaderHeight = UITableViewAutomaticDimension
        sectionFooterHeight = 0
        estimatedRowHeight = 85
        estimatedSectionHeaderHeight = roofUISectionHeaderHeight
        estimatedSectionFooterHeight = 1
        delaysContentTouches = false
        
        updateStyle()
    }
    
    
    func setNullFooter() {
        let nullView = UIView(frame: CGRect(x: 0,y: 0,width: 0.01,height: 0.01))
        setAndLayoutTableFooterView(nullView, animated: true)
    }
    
    func setAutolayoutFooter(_ footer: UIView, animated: Bool) {
        let tooBig: CGFloat = 300
        footer.frame = CGRect(x: 0,y: 0, width: UIScreen.main.bounds.height, height: tooBig)
        setAndLayoutTableFooterView(footer, animated: animated)
    }
    
    
    /// Sets mutable properties based on the set style
    func updateStyle() {
        
        ///There must be a style.
        guard let style_ = style_ else { return }
        
        self.backgroundColor = style_.backgroundColor
        bounces = style_.bounces
    }
    
    
    //set the tableHeaderView so that the required height can be determined, update the header's frame and set it again
    private func setAndLayoutTableFooterView(_ footer: UIView, animated: Bool) {
        self.tableFooterView = footer
        footer.setNeedsLayout()
        footer.layoutIfNeeded()
        let height = footer.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height
        var frame = footer.frame
        frame.size.height = height
        
        if animated {
            footer.alpha = 0
            UIView.animate(
                withDuration: roofUITimeIntervalStandard,
                delay: 0,
                options: UIViewAnimationOptions.curveEaseOut,
                animations: {
                    footer.frame = frame
                    self.tableFooterView = footer
                    self.tableFooterView?.layoutIfNeeded()
                },
                completion: {
                    completed in
                    UIView.animate(
                        withDuration: 0,
                        delay: roofUITimeIntervalLong,
                        options: UIViewAnimationOptions.curveLinear,
                        animations: {
                            footer.alpha = 1
                        },
                        completion: nil
                    )
                }
            )
        }
        else {
            footer.frame = frame
            self.tableFooterView = footer
        }
    }
}
