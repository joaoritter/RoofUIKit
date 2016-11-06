//
//  RoofUIActivity.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 7/26/15.
//  Copyright © 2015 Roof. All rights reserved.
//

import Foundation
import UIKit

class RoofUIActivityIndicatorPresentationController: UIPresentationController {
    
    //MARK: private vars

    private let motionMaximum: CGFloat = 15
    private var horizontalInterpolatingMotionMaximum: CGFloat {
        return self.motionMaximum
    }
    private var horizontalInterpolatingMotionMinimum: CGFloat {
        return -self.motionMaximum
    }
    private var verticalInterpolatingMotionMaximum: CGFloat {
        return self.motionMaximum
    }
    private var verticalInterpolatingMotionMinimum: CGFloat {
        return -self.motionMaximum
    }
    private var backgroundShadowColor = UIColor(white: 0, alpha: 0.2)
    

    
    //MARK: public funcs

    override func presentationTransitionWillBegin() {
        guard let container = self.containerView,
            let presentedView = presentedView else { return }
        setupMotionEffectsForView(view: presentedView)
        let presentingView = presentingViewController.view
        let shadow = UIView(frame: container.bounds)
        shadow.backgroundColor = backgroundShadowColor
        shadow.alpha = 0
        container.insertSubview(shadow, at: 0)
        let tc = presentingViewController.transitionCoordinator!
        tc.animate(alongsideTransition: {
            _ in
            shadow.alpha = 1
            }, completion: {
                _ in
                presentingView?.tintAdjustmentMode = .dimmed
        })
    }
    
    override func dismissalTransitionWillBegin()
    {
        guard let container = self.containerView else { return }
        
        let presentingView = presentingViewController.view
        if let shadow = (container.subviews as [UIView]).first
        {
            let tc = presentingViewController.transitionCoordinator!
            tc.animate(alongsideTransition: {
                _ in
                shadow.alpha = 0
                }, completion: {
                    _ in
                    presentingView?.tintAdjustmentMode = .automatic
            })
        }
    }
    
    
    //MARK: public funcs

    private func setupMotionEffectsForView(view: UIView) {
        let xAxis = UIInterpolatingMotionEffect(
            keyPath: "center.x",
            type: UIInterpolatingMotionEffectType.tiltAlongHorizontalAxis
        )
        let yAxis = UIInterpolatingMotionEffect(
            keyPath: "center.y",
            type: UIInterpolatingMotionEffectType.tiltAlongVerticalAxis
        )
        xAxis.minimumRelativeValue = horizontalInterpolatingMotionMinimum
        xAxis.maximumRelativeValue = horizontalInterpolatingMotionMaximum
        yAxis.minimumRelativeValue = verticalInterpolatingMotionMinimum
        yAxis.maximumRelativeValue = verticalInterpolatingMotionMaximum
        view.addMotionEffect(xAxis)
        view.addMotionEffect(yAxis)
    }
}
