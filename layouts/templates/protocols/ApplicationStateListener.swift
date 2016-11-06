//
//  ApplicationStateListener.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 11/2/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation

@objc protocol ApplicationStateListener: class {
    func handleApplicationDidBecomeActive()
}

extension ApplicationStateListener {
    
    func setupApplicationDidBecomeActiveNotification() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleApplicationDidBecomeActive),
            name: NSNotification.Name.UIApplicationDidBecomeActive,
            object: nil
        )
    }
    
    func removeApplicationDidBecomeActiveNotification() {
        NotificationCenter.default.removeObserver(
            self,
            name: NSNotification.Name.UIApplicationDidBecomeActive,
            object: nil
        )
    }
}
