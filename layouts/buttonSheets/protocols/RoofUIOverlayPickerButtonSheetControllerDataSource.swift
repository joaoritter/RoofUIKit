//
//  File.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 7/24/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation

protocol RoofUIOverlayPickerButtonSheetControllerDataSource: RoofUIOverlayButtonSheetControllerDataSource {
    func numberOfSections() -> Int
    func numberOfRowsInSection(section: Int) -> Int
    func titleForRow(row: Int, ofSectionAtIndex section: Int) -> String?
    func rowIsSelected(row: Int, inSectionAtIndex section: Int) -> Bool
}
