//
//  RoofUIButtonSheetViewController.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 5/9/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit

import Spring

///A view controller for a button sheet page.
class RoofUIButtonSheetViewController: RoofUIViewController, RoofUIButtonSheetDataSource, RoofUIButtonSheetDelegate {
    
    //MARK: public vars
    var buttonSheet: RoofUIButtonSheetView {
        return view as! RoofUIButtonSheetView
    }
    
    //MARK: private vars
    ///Close the buttonSheet if it is in a floating nav.
    private var tapOutsideCloses: Bool {
        return self.navigationController is RoofUIFloatingNavigationController
    }
    
    ///The style of the button sheet.
    let buttonSheetStyle: RoofUIButtonSheetStyle
    
    
    //MARK: init
    init(
        leftButtonType: RoofUILeftNavigationBarButtonType = .none,
        rightButtonType: RoofUIRightNavigationBarButtonType = .none,
        style: RoofUINavigationBarStyle? = RoofUINavigationBarStyleDefault(),
        buttonSheetStyle: RoofUIButtonSheetStyle = RoofUIButtonSheetFormStyleDefault(),
        shouldShowSplashAnimation: Bool = false
        ) {
        self.buttonSheetStyle = buttonSheetStyle
        super.init(
            leftButtonType: leftButtonType,
            rightButtonType: rightButtonType,
            style: style,
            shouldShowSplashAnimation: shouldShowSplashAnimation
        )
    }
    
    /// Unused, but required.
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    //MARK: public funcs
    
    override func loadView() {
        super.loadView()
        view = RoofUIButtonSheetView(
            frame: UIScreen.main.bounds,
            style: buttonSheetStyle
        )
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        buttonSheet.buttonSheetContainer.layer.shadowPath = UIBezierPath(rect: buttonSheet.buttonSheetContainer.bounds).cgPath
    }
    
    override func setup() {
        super.setup()
        setupDelegatesAndDataSources()
        var navigationBarHeight: CGFloat = 0
        if let navigationController = navigationController, !navigationController.navigationBar.isHidden {
            navigationBarHeight = self.navigationController!.navigationBar.frame.height
        }
        buttonSheet.adjustHeightWithOffset(navigationBarHeight)

        addDissmissGesture()
        buttonSheet.scrollView.isScrollEnabled = true
    }

    
    func didTapScreen(_ gesture: UITapGestureRecognizer) {
        
        guard let buttonSheetContainer = (view as? RoofUIButtonSheetView)?.buttonSheetContainer, tapOutsideCloses else { return }
        
        if !gesture.isInsideView(buttonSheetContainer) {
            presentingViewController?.dismiss(animated: true, completion: nil)
        }
    }
    
    /// Attaches delegates and data sources.
    func setupDelegatesAndDataSources() {
        buttonSheet.delegate = self
        buttonSheet.dataSource = self
    }
    
    ///CANT PUT THESE IN EXTENSIONS BECAUSE THEY WILL BE OVERRIDEN.
    func roofUIButtonSheet(buttonSheet: RoofUIButtonSheetView, didTapButtonAtIndex index: Int) {}
    func numberOfButtonsInRoofUIButtonSheet(buttonSheet: RoofUIButtonSheetView) -> Int {
        return 1
    }
    func roofUIButtonSheet(buttonSheet: RoofUIButtonSheetView, titleForButtonAtIndex index: Int) -> String? {
        return "Done"
    }
    func roofUIButtonSheet(buttonSheet: RoofUIButtonSheetView, styleForButtonAtIndex index: Int) -> RoofUIButtonStyle? {
        return RoofUIButtonStyleBlueA()
    }
    
    //MARK: private funcs
    private func addDissmissGesture() {
        let gesture = UITapGestureRecognizer(
            target: self,
            action: #selector(didTapScreen)
        )
        gesture.cancelsTouchesInView = false
        view.addGestureRecognizer(gesture)
    }
}
