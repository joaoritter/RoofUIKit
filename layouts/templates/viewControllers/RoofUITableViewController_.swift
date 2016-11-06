//
//  RoofUITableViewController.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 8/10/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit
import CoreData

///A view controller with Roof needs.
class RoofUITableViewController_: UITableViewController, BaseViewController, ApplicationStateListener, NavigationButtonManager, SwipeToDismissController {
    
    ///MARK: public vars
    
    var style_: RoofUINavigationBarStyle? {
        didSet { updateStyle() }
    }
    
    var swipeGestureRecognizerDelegate: UIGestureRecognizerDelegate? {
        return self
    }
    
    var leftButtonType: RoofUILeftNavigationBarButtonType
    var rightButtonType: RoofUIRightNavigationBarButtonType
    weak var dismissSwipeGesture: UIPanGestureRecognizer?

    ///Functions to run when the view is for sure on screen. Necessary because of splash screen.
    var viewIsShowingFunctions: [(()->Void)] = []
    var shouldShowSplashAnimation: Bool

    
    //MARK: init
    
    init(
        leftButtonType: RoofUILeftNavigationBarButtonType = .none,
        rightButtonType: RoofUIRightNavigationBarButtonType = .none,
        style: RoofUINavigationBarStyle?,
        shouldShowSplashAnimation: Bool = false
        ) {
        
        self.style_ = style
        self.leftButtonType = leftButtonType
        self.rightButtonType = rightButtonType
        self.shouldShowSplashAnimation = shouldShowSplashAnimation

        super.init(
            nibName: nil,
            bundle: nil
        )
        setupApplicationDidBecomeActiveNotification()
    }
    deinit {
        removeApplicationDidBecomeActiveNotification()
    }
    
    /// Unused, but required.
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    //MARK: public funcs
    override var prefersStatusBarHidden : Bool { return false }
    override var preferredStatusBarStyle : UIStatusBarStyle { return UIStatusBarStyle.default }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addSwipeGesture()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        runViewDidAppearFunctions()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showSplash()
        view.setup()
        setup()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeSwipeGesture()
    }
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?) {
        viewControllerToPresent.modalTransitionStyle = self.modalPresentStyle
        OperationQueue.main.addOperation {
            super.present(viewControllerToPresent, animated: flag, completion: completion)
        }
    }

    func setup() {
        setupBase()
        setupNavigation(
            leftButtonType: leftButtonType,
            rightButtonType: rightButtonType
        )
    }
    
    func handleApplicationDidBecomeActive(){}

    func actionForLeftBarButtonItem() {
        actionForLeftBarButtonType(leftBarButtonType: leftButtonType)
    }
    
    func actionForRightBarButtonItem() {
        actionForRightBarButtonType(rightBarButtonType: rightButtonType)
    }
    
    func handleSwipe(_ gesture: UIPanGestureRecognizer) {
        backActionFor(gesture: gesture, leftBarButtonType: leftButtonType)
    }
}

extension RoofUITableViewController_: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
