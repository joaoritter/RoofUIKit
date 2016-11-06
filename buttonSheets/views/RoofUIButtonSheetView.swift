//
//  RoofUIButtonSheetView.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 5/9/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Spring

///A view accompanied by buttons.
class RoofUIButtonSheetView: UIView {
    
    //MARK: public vars
    
    ///The button sheet's style.
    var style_: RoofUIButtonSheetStyle? {
        didSet {
            updateStyle()
        }
    }
    
    ///The container for the buttons.
    let buttonsView: RoofUIButtonsView = RoofUIButtonsView()
    
    ///The container view for the buttons.
    let bodyView: UIView = UIView()
    
    ///The datasource.
    weak var dataSource: RoofUIButtonSheetDataSource? {
        didSet {
            reloadData()
            
            ///Need to update the new button's colors.
            updateStyle()
        }
    }
    
    ///The delegate.
    weak var delegate: RoofUIButtonSheetDelegate?
    
    
    ///The view containing the content.
    var contentView: SpringView = SpringView()
    
    ///The view containing the scrolling content.
    lazy var scrollView: TPKeyboardAvoidingScrollView = {
    
        let scrollView = TPKeyboardAvoidingScrollView()
    
        ///Immutable properties
        scrollView.delaysContentTouches = false
        scrollView.alwaysBounceHorizontal = false
        scrollView.backgroundColor = nil
    
        return scrollView
    }()
    
    lazy var buttonSheetContainer: UIView = {
        let buttonSheetContainer = UIView()
        
        ///Set immutable pripoerties
        buttonSheetContainer.layer.cornerRadius = roofUICornerRadius
        
        ///Makes shadows more efficient
        buttonSheetContainer.layer.shouldRasterize = true
        buttonSheetContainer.layer.rasterizationScale = UIScreen.main.scale
        
        return buttonSheetContainer
    }()
    
    
    let bodyMargin = roofUIMarginD

    //MARK: private vars

    private let horizontalLargeMargin = roofUIMarginA
    private let bottomMinPadding = roofUIMarginD
    private let topPadding: CGFloat = roofUIMarginD
    private let raiseTransitionDuration: TimeInterval = roofUITimeIntervalShort
    private let floatingPadding = roofUIMarginC
    private let bottomPadding = roofUIMarginE

    //MARK: init
    
    init(frame: CGRect = CGRect.zero, style: RoofUIButtonSheetStyle) {
        self.style_ = style
        super.init(frame: frame)
    }
    
    /// Unused but required.
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    //MARK: public funcs
    
    override func setup() {
        super.setup()
        updateStyle()
    }
    
    override func addSubviews() {
        super.addSubviews()
        
        addSubview(scrollView)

        scrollView.addSubview(contentView)
        contentView.addSubview(buttonSheetContainer)

        //Add the labels.
        buttonSheetContainer.addSubview(bodyView)
        buttonSheetContainer.addSubview(buttonsView)
    }
    
    
    override func makeConstraints() {
        //Scroll view autolayout
        //https://www.natashatherobot.com/ios-autolayout-scrollview/
       
        scrollView.snp.remakeConstraints {
            make in
            make.edges.equalTo(self)
        }
        
        contentView.snp.remakeConstraints {
            (make) -> Void in
            make.left.equalTo(scrollView)
            make.right.equalTo(scrollView)
            make.top.equalTo(scrollView)
            make.width.equalTo(self)
            make.bottom.equalTo(scrollView)
            make.height.greaterThanOrEqualTo(scrollView)
        }
        
        buttonSheetContainer.snp.remakeConstraints {
            make in
                ///Random positive number
                make.height.greaterThanOrEqualTo(100)
                make.top.greaterThanOrEqualTo(contentView).offset(topPadding).priority(roofUILayoutPriorityHigh)
                make.bottom.equalTo(contentView).offset(-bottomPadding)
                make.left.equalTo(contentView).offset(floatingPadding)
                make.right.equalTo(contentView).offset(-floatingPadding)
        }

        bodyView.snp.remakeConstraints {
            (make) -> Void in
            make.left.equalTo(buttonSheetContainer)
            make.right.equalTo(buttonSheetContainer)
            
            ///No overflows.
            make.top.equalTo(buttonSheetContainer)
            
        }

        buttonsView.snp.remakeConstraints {
            (make) -> Void in


            make.top.equalTo(bodyView.snp.bottom).offset(bodyMargin)
            make.bottom.equalTo(buttonSheetContainer).offset(-horizontalLargeMargin)
            
            ///Prioritize bottom margin.
            
            make.width.lessThanOrEqualTo(bodyView)
            make.centerX.equalTo(buttonSheetContainer)

            ///Prioritize width constraint.
            make.left.equalTo(buttonSheetContainer).offset(horizontalLargeMargin).priority(roofUILayoutPriorityHigh)
            make.right.equalTo(buttonSheetContainer).offset(-horizontalLargeMargin).priority(roofUILayoutPriorityHigh)
        }
        
        super.makeConstraints()
    }
    
    ///Adjust the size to compensate for the navigation bar.
    func adjustHeightWithOffset(_ offset: CGFloat) {
        contentView.snp.updateConstraints {
            (make) -> Void in
            make.height.greaterThanOrEqualTo(scrollView).offset(-(offset + 20))
        }
    }
    
    func raiseAnimated(_ animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        let buttonSheetContainerPaddingTop = buttonSheetContainer.frame.origin.y
        let desiredPadding = topPadding
        let estimatedKeyboardHeight: CGFloat = 260
        let difference = buttonSheetContainerPaddingTop - desiredPadding
        if buttonSheetContainerPaddingTop > desiredPadding {
            let rect = CGRect(x: 0, y: self.frame.height - estimatedKeyboardHeight + difference, width: 1, height: 1)
            scrollView.scrollRectToVisible(rect, animated: true)
        }
    }


    ///Reloads the dataSource data.
    func reloadData() {
        
        ///If there is no data source, there's nothing to do.
        guard let dataSource = dataSource else { return }
        
        ///Reset the buttons array.
        var buttons_: [RoofUIButtonView] = []
        
        for i in 0..<dataSource.numberOfButtonsInRoofUIButtonSheet(buttonSheet: self) {
            
            
            let currentButton = buttonsView.buttons.get(i)
            
            let button = currentButton ?? RoofUIButtonView()
            
            let style = dataSource.roofUIButtonSheet(
                buttonSheet: self,
                styleForButtonAtIndex: i
            )

            button.style_ = style
                        
            let title = dataSource.roofUIButtonSheet(
                buttonSheet: self,
                titleForButtonAtIndex: i
            )
            
            button.primaryLabel.text = title

            setupTapForButton(button)
            
            buttons_.append(button)
        }
        
        buttonsView.buttons = buttons_
    }
    
    /// The function to run when a button is tapped.
    func didTapButton(_ button: RoofUIButtonView) {
        
        ///Find the index of the tapped button.
        guard let index = buttonsView.buttons.index(of: button) else { return }
        
        delegate?.roofUIButtonSheet(
            buttonSheet: self,
            didTapButtonAtIndex: index
        )
    }
    
    
    
    /// Sets mutable properties based on the set style
    func updateStyle() {
        
        ///There must be a style.
        guard let style_ = style_ else { return }
        self.buttonSheetContainer.backgroundColor = style_.backgroundColor
        self.buttonSheetContainer.layer.shadowOffset = style_.shadowOffset ?? CGSize.zero
        self.buttonSheetContainer.layer.shadowColor = style_.shadowColor?.cgColor
        self.buttonSheetContainer.layer.shadowOpacity = style_.shadowOpacity ?? 0
        self.buttonSheetContainer.layer.shadowRadius = style_.shadowRadius ?? 0
    }
    
    
    //MARK: private funcs
    

    /// Makes the button tappable.
    private func setupTapForButton(_ button: RoofUIButtonView) {
        button.addTarget(
            self,
            action: #selector(didTapButton),
            for: .touchUpInside
        )
    }
}
