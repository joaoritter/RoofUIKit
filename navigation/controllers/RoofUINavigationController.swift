//
//  RoofUINavigationController.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 4/22/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit

class RoofUINavigationController: UINavigationController, NavigationBarColorDelegate, Dimmable  {
    
    //MARK: public vars
    
    ///A boolean indicaiting weather the navigation bar should be transparent.
    var navigationBarColor: UIColor? {
        didSet {
            
            ///If the value didn't change, return.
            guard navigationBarColor != oldValue else { return }
            setNavigationBarColorTo(navigationBarColor)
        }
    }

    private let navigationControllerTransitionInterval: TimeInterval = roofUITimeIntervalStandard
        

    //MARK: public funcs
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.default
    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        UIApplication.shared.keyWindow?.hideMessage()
        super.pushViewController(viewController, animated: animated)
    }
    
    func popToViewCotrollerOfType(_ anyClass: AnyClass, animated: Bool = true) -> Bool {
        for controller in self.viewControllers {
            if controller.isKind(of: anyClass) {
                popToViewController(controller, animated: animated)
                return true
            }
        }
        return false
    }
    
    /// Shows a floating navigation controller of button sheets.
    func showFloatingNavigationController(withRootButtonSheetController buttonSheetController: RoofUIButtonSheetViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        
        let navigationController = RoofUIFloatingNavigationController(rootViewController: buttonSheetController)
        navigationController.controllerToDimUponPresenting = self
        present(navigationController, animated: animated, completion: completion)
    }
    
    /// Goes to the root.
    func resetToController(_ rootController: UIViewController) {
        guard !popToViewCotrollerOfType(rootController.classForCoder) else { return }
        pushViewController(rootController, animated: true)
    }
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?) {
        super.present(viewControllerToPresent, animated: flag, completion: completion)
        (topViewController as? RoofUIButtonSheetViewController)?.viewWillDisappear(flag)
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)?) {
        super.dismiss(animated: flag, completion: completion)
        (topViewController as? RoofUIButtonSheetViewController)?.viewWillAppear(flag)
    }
    
    /// Goes to the root.
    func fadeToController(_ rootController: UIViewController) {
        let transition = CATransition()
        transition.duration = navigationControllerTransitionInterval
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        transition.type = kCATransitionFade
        
        self.view.layer.add(transition, forKey: nil)
        self.pushViewController(rootController, animated: false)
    }
    
    
    func addShadow() {
        navigationBar.layer.shadowColor = roofUINavShadowColor.cgColor
        navigationBar.layer.shadowRadius = roofUINavShadowRadius
        navigationBar.layer.shadowOpacity = roofUINavShadowOpacity
        navigationBar.layer.shadowOffset = CGSize(width: 0, height: roofUINavShadowHeight)
    }
    
    func removeShadow() {
        navigationBar.layer.shadowColor = nil
        navigationBar.layer.shadowRadius = 0
        navigationBar.layer.shadowOpacity = 0
        navigationBar.layer.shadowOffset = CGSize.zero
    }
    
    /// Setup the navigation controller.
    func setup() {
        delegate = self
        setToolbarHidden(
            true,
            animated: false
        )
    }
}
