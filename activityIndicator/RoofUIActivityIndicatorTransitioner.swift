//
//  ActivityIndicatorTransitioner.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 2/13/15.
//  Copyright (c) 2015 Roof. All rights reserved.
//

import Foundation
import UIKit

class RoofUIActivityIndicatorTransitioner: NSObject {
    
    //MARK: private vars
    
    fileprivate let fadeTime: TimeInterval = roofUITimeIntervalShort
    fileprivate let transformScale: CGFloat = 1.3
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return RoofUIActivityIndicatorPresentationController(
            presentedViewController: presented,
            presenting: presenting
        )
    }
}

extension RoofUIActivityIndicatorTransitioner: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
}

extension RoofUIActivityIndicatorTransitioner: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return fadeTime
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let presenterView = transitionContext.view(forKey: UITransitionContextViewKey.from)
        let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.to)
        
        
        if let presentedView = presentedView {
             transitionContext.containerView.addSubview(presentedView)
            presentedView.transform = CGAffineTransform(scaleX: transformScale, y: transformScale)
            presentedView.alpha = 0
            UIView.animate(
                withDuration: fadeTime,
                animations: {
                    presentedView.alpha = 1
                    presentedView.transform = CGAffineTransform.identity
                }, completion: {
                    _ in
                    transitionContext.completeTransition(true)
                }
            )
        }
        else if let presenterView = presenterView {
            UIView.animate(
                withDuration: fadeTime,
                animations: {
                    presenterView.alpha = 0
                }, completion: {
                    (completed) in
                    transitionContext.completeTransition(true)
                }
            )
        }
    }
}


