//
//  CellTypes.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 5/6/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation

enum RoofUITableViewCellType {
    case action
    case detail
    case status
    case segue
    
    var stringValue: String {
        switch self {
        case .action: return "action"
        case .detail: return "detail"
        case .status: return "status"
        case .segue: return "segue"
        }
    }
}
