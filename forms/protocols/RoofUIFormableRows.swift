//
//  MultiTextFieldFormableRow.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 7/25/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import Former

protocol RoofUITextFieldFormableRow: FormableRow {
    var textField: RoofUITextField { get }
}

protocol RoofUIDoubleTextFieldRowFormableRow: FormableRow {
    var textField1: RoofUITextField { get }
    var textField2: RoofUITextField { get}
}

protocol RoofUIPreviewFieldFormableRow: FormableRow {
    var titleLabel: RoofUILabel { get }
    var contentLabel: RoofUILabel { get }
    var title: String? { get set }
    var content: String? { get set }
}

protocol RoofUICheckFormableRow: FormableRow {
    var label: RoofUILabel { get }
}

protocol RoofUISwitchFormableRow: FormableRow {
    var toggleSwitch: RoofUISwitch { get }
    var label: RoofUILabel { get }
}
