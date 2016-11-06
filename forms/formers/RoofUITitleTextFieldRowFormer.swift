//
//  RoofUITitleTextFieldRowFormer.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 5/26/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit
import Former

/// A text field with a title.
class RoofUITitleTextFieldRowFormer<T: RoofUIFormTitleTextFieldTableViewCell>: RoofUIRowFormer<T>, RoofUITextFieldsRowFormer where T: RoofUITextFieldFormableRow {
    
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
