//
//  Array+Getting.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 5/4/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation

extension Array {
    func get(_ index: Int) -> Element? {
        
        /// Can't use a negative number to index.
        guard index >= 0 else { return nil }
        
        /// Can't index greater than the array length.
        guard index < self.count else { return nil }
        
        return self[index]
    }
}
