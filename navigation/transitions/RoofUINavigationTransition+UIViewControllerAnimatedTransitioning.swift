//
//  RoofUIPushAnimatedTransitioning+UIViewControllerAnimatedTransitioning.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 5/3/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit

///Conform to the UIViewControllerAnimatedTransitioning protocol.
extension RoofUINavigationTransition: UIViewControllerAnimatedTransitioning {
    
    ///The transition logic.
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)?.view,
            let toView = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)?.view
            else {
                return
        }
        
        ///Make the destination offset for the current view.
        let width = transitionContext.containerView.frame.size.width
        var endOffset = fromView.frame
        
        ///The direction of the transition depends on the type of transition.
        endOffset.origin.x = operation == .push ? -width : width
        
        ///Set the incoming view to being offscreen.
        var initialOffscreenOffset = toView.frame
        
        ///The direction of the transition depends on the type of transition.
        initialOffscreenOffset.origin.x = operation == .push ? width : -width
        
        toView.frame = initialOffscreenOffset
        
        ///Add the new view.
        transitionContext.containerView.addSubview(toView)
        
        ///Start the animation.
        UIView.animate(
            withDuration: self.transitionDuration(using: transitionContext),
            animations: {
                ///Move everything to their final values.
                toView.frame.origin.x = fromView.frame.origin.x
                fromView.frame = endOffset
                fromView.layer.opacity = 1
            },
            completion: {
                [weak self](finished) in
                
                ///Set properties to final value.
                fromView.layer.opacity = 1;
                toView.layer.shadowOpacity = 0;

                ///Complete the transition.
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                
                ///Run the custom completion.
                self?.completion?()
            }
        )
    }
    
    ///The transition duration.
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitionDuration
    }
}
