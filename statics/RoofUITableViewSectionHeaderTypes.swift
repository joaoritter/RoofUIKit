//
//  TableViewSectionHeaderTypes.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 5/6/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation

enum RoofUITableViewSectionHeaderType {
    case labeled
    case description
    
    var stringValue: String {
        switch self {
        case .labeled: return "labeled"
        case .description: return "description"
        }
    }
}


enum RoofUITableViewSectionFooterType {
    case action
  
    var stringValue: String {
        switch self {
        case .action: return "action"
        }
    }
}
