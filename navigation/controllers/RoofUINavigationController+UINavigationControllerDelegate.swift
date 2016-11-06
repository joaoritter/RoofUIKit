//
//  RoofUINavigationController+UINavigationControllerDelegate.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 5/3/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit

///Conform to the UINavigationControllerDelegate protocol.
extension RoofUINavigationController: UINavigationControllerDelegate {
    
    ///Set custom transition.
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return RoofUINavigationTransition(operation: operation)
    }
}
