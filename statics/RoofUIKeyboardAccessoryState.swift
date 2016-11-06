//
//  RoofUIKeyboardAccessoryState.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 6/13/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation

enum RoofUIKeyboardAccessoryState {
    case next
    case submit(title: String)
    
    var title: String? {
        switch self {
        case .next: return "Next"
        case .submit(let title): return title
        }
    }
}
