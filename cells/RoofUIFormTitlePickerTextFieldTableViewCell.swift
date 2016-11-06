//
//  RoofUIFormTitlePickerTextFieldTableViewCell.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 7/28/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit

import Former

///A cell that is a picker view in a form.
class RoofUIFormTitlePickerTextFieldTableViewCell: RoofUIFormTitleTextFieldTableViewCell {

    override func setup() {
        super.setup()
        textField.clearButtonMode = .never
    }
}
