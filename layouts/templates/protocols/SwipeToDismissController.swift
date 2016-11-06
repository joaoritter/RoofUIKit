//
//  SwipeToDismissController.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 11/2/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation

@objc protocol SwipeToDismissController: class {
    weak var dismissSwipeGesture: UIPanGestureRecognizer? { get set }
    var swipeGestureRecognizerDelegate: UIGestureRecognizerDelegate? { get }
    var view: UIView! { get set }

    func actionForLeftBarButtonItem()
    @objc func handleSwipe(_ gesture: UIPanGestureRecognizer)
}

extension SwipeToDismissController {

    func addSwipeGesture() {
        let dismissSwipeGesture = UIPanGestureRecognizer(
            target: self,
            action: #selector(handleSwipe)
        )
        dismissSwipeGesture.delegate = swipeGestureRecognizerDelegate
        
        dismissSwipeGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(dismissSwipeGesture)
        
        self.dismissSwipeGesture = dismissSwipeGesture
    }
    
    func removeSwipeGesture() {
        guard let dismissSwipeGesture = dismissSwipeGesture else { return }
        view.removeGestureRecognizer(dismissSwipeGesture)
    }
    
    func closeActionFor(gesture: UIPanGestureRecognizer, leftBarButtonType: RoofUILeftNavigationBarButtonType) {
        if gesture.velocity(in: view).y > roofUIStandardSwipeThreshold && gesture.translation(in: view).y > roofUIStandardSwipeDistanceThreshold {
            switch leftBarButtonType {
            case .close:
                actionForLeftBarButtonItem()
            default: return
            }
        }
    }
    
    func backActionFor(gesture: UIPanGestureRecognizer, leftBarButtonType: RoofUILeftNavigationBarButtonType) {
        if gesture.velocity(in: view).x > roofUIStandardSwipeThreshold && gesture.translation(in: view).x > roofUIStandardSwipeDistanceThreshold {
            switch leftBarButtonType {
            case .back:
                actionForLeftBarButtonItem()
            default: return
            }
        }
    }
}
