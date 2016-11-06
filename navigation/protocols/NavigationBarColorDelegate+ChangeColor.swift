//
//  NavigationBarColorDelegate+ChangeColor.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 6/8/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit

extension NavigationBarColorDelegate {
    func setNavigationBarColorTo(_ color: UIColor?) {
        
        ///If there is a navigationBarColor, set it.
        if let color = color {
            navigationBar.barTintColor = color
            navigationBar.isTranslucent = false
            navigationBar.setBackgroundImage(
                UIImage(),
                for: UIBarMetrics.default
            )
            navigationBar.shadowImage = UIImage()
        }
        else {
            navigationBar.barTintColor = nil
            navigationBar.setBackgroundImage(
                nil,
                for: UIBarMetrics.default
            )
            navigationBar.shadowImage = nil
            navigationBar.isTranslucent = true
        }
    }
}
