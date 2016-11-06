//
//  RoofUITextFieldRowFormer.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 7/25/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit
import Former

class RoofUITextFieldRowFormer<T: RoofUIFormTextFieldTableViewCell>: RoofUIRowFormer<T>, RoofUITextFieldsRowFormer where T: RoofUITextFieldFormableRow {
    override var isEnabled: Bool {
        didSet {
            cell.textField.isEnabled = isEnabled
        }
    }
    
    var textFields: [RoofUITextField] {
        return [cell.textField]
    }
    
    open override func cellSelected(indexPath: IndexPath) {
        let textField = cell.textField
        if !textField.isEditing {
            textField.isUserInteractionEnabled = true
            textField.becomeFirstResponder()
        }
    }
}
