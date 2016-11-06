//
//  PushAnimatedTransitioning.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 5/3/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit

class RoofUINavigationTransition: NSObject {

    ///A function to run once the transition has completed.
    var completion: (() -> Void)?
    
    let transitionDuration = roofUITimeIntervalStandard
    
    ///Whether the transition is a Push or a Pop.
    let operation: UINavigationControllerOperation
    
    /// Creates a new push transition object.
    init(operation: UINavigationControllerOperation) {
        self.operation = operation
        super.init()
    }
}
