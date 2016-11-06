//
//  UIApplication+TopViewController.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 10/31/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation

extension UIApplication {
    
    /// Returns the top view controller of the application.
    class func topViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }
        return base
    }
}
