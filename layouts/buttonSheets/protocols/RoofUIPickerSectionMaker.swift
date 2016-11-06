//
//  RoofUIPickerSectionMaker.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 7/25/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import Former

///An object that can make pickers.
protocol RoofUIPickerSectionMaker: class {
    func makePickerSection() -> SectionFormer?
    var hasSelectAllToggle: Bool { get }
    var titleForToggle: String? { get }
}