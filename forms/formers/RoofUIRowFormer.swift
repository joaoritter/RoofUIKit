//
//  RoofUIRowFormer.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 10/31/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit
import Former

///Base form row class
class RoofUIRowFormer<T: RoofUITableViewCell>: BaseRowFormer<T>, Formable, RoofUISelectableRowFormer, RoofUIOptionalFormer where T: FormableRow {
    
    //True if this field is optional and doesn't have to be filled.
    var isOptional = false
    
    //The form will auto select the first field with shouldSelectOnLoad set to true.
    var shouldSelectOnLoad = false
    
    //If the field can be changed
    var isEnabled: Bool = true
    
    init() {
        super.init() {
            cell in
            cell.setup()
        }
        self.configure {
            former in
            
            /// Use autolayout
            former.rowHeight = UITableViewAutomaticDimension
        }
    }
    
    required init(instantiateType: Former.InstantiateType, cellSetup: ((T) -> Void)?) {
        fatalError("init(instantiateType:cellSetup:) has not been implemented")
    }
}
