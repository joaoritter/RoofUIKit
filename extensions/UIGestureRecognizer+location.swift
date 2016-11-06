//
//  UIGestureRecognizer+location.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 10/20/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation

extension UIGestureRecognizer {
    func isInsideView(_ view: UIView) -> Bool {
        let location = self.location(in: view)
        if location.x < 0 || location.y < 0 { return false }
        if location.x > view.frame.width || location.y > view.frame.height { return false }
        return true
    }
}
