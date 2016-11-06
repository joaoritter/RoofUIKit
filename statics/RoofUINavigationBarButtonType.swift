//
//  RoofUINavigationBarButtonType.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 6/17/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import CoreData

enum RoofUIRightNavigationBarButtonType {
    case new
    case none
    case info
    case custom(image: UIImage?)
}

enum RoofUILeftNavigationBarButtonType {
    case back
    case check
    case close
    case custom(image: UIImage?)
    case none
}
