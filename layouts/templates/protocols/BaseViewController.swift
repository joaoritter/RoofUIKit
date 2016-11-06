//
//  BaseViewController.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 11/2/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import GSMessages
import RevealingSplashView

protocol BaseViewController: class {
    var navigationController: UINavigationController? { get }
    var style_: RoofUINavigationBarStyle? { get set }
    var viewIsShowingFunctions: [(()->Void)] { get set }
    var leftButtonType: RoofUILeftNavigationBarButtonType { get set }
    var rightButtonType: RoofUIRightNavigationBarButtonType { get set }
    var extendedLayoutIncludesOpaqueBars: Bool { get set }
    var view: UIView! { get set }
    var shouldShowSplashAnimation: Bool { get set }
}

extension BaseViewController {
   
    //MARK: public vars
    var roofNavigationController: RoofUINavigationController? {
        return navigationController as? RoofUINavigationController
    }

    var modalPresentStyle: UIModalTransitionStyle {
        return .coverVertical
    }
    
    var splashImage: UIImage? {
        return UIImage(named: "logoOutline")
    }
    
    var isShowing: Bool {
        return view.window != nil
    }
    
    //MARK: public funcs
    func setupBase() {
        extendedLayoutIncludesOpaqueBars = true
        setupBanner()
        updateStyle()
    }

    /// Runs functions when the view appears.
    func runViewDidAppearFunctions() {
        if !shouldShowSplashAnimation {
            for function in self.viewIsShowingFunctions {
                function()
            }
        }
    }
    
    /// Sets mutable properties based on the set style
    func updateStyle() {
        ///There must be a style.
        guard let style_ = style_ else { return }
        
        (navigationController as? RoofUINavigationController)?.navigationBarColor = style_.backgroundColor
        
        ///Create attributes dictionary with text color.
        let attributes: [String : AnyObject] = [
            NSForegroundColorAttributeName: style_.titleStyle.textColor ?? UIColor.black,
            NSFontAttributeName: style_.titleStyle.font ?? UIFont.systemFont(ofSize: 14)
        ]
        
        ///Set the attributes.
        navigationController?.navigationBar.titleTextAttributes = attributes
        
        (UIApplication.shared.delegate as? AppDelegate)?.window?.tintColor = style_.titleStyle.textColor
    }

    
    func showSplash() {
        if let splashImage = splashImage, shouldShowSplashAnimation {
            let aspectRatio = splashImage.size.height / splashImage.size.width
            
            let revealingSplashView = RevealingSplashView(
                iconImage: splashImage,
                iconInitialSize: CGSize(width: 180, height: 180*aspectRatio),
                backgroundColor: roofUINeutralAColor
            )
            revealingSplashView.delay = 0.2
            revealingSplashView.duration = 1.5
            
            self.navigationController?.view.addSubview(revealingSplashView)
            
            revealingSplashView.startAnimation() {
                ///Dont show the swipe animation again.
                self.shouldShowSplashAnimation = false
                for function in self.viewIsShowingFunctions {
                    function()
                }
            }
        }
    }
    
    
    //MARK: private funcs

    /// Sets up styles for a popup banner.
    
    private func setupBanner() {
        if let font = RoofUITextStyleThinSmallGrayH().font {
            GSMessage.font = font
        }
        GSMessage.successBackgroundColor = roofUISecondaryColor
        GSMessage.warningBackgroundColor = roofUIAlertColor
        GSMessage.errorBackgroundColor = roofUIAlertColor
        GSMessage.infoBackgroundColor = roofUINeutralGColor
    }
}
