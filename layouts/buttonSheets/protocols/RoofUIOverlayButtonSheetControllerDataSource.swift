//
//  RoofUIConfirmationButtonSheetControllerData.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 7/24/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation

protocol RoofUIOverlayButtonSheetControllerDataSource: class {
    func titleTextInOverlay(tag: OverlayTag?) -> String?
    func confirmationButtonTextInOverlay(tag: OverlayTag?) -> String?
}

protocol RoofUIPickerOverlayButtonSheetControllerDataSource: class {
    func titleTextInOverlay(tag: Int?) -> String?
    func numberOfSectionsInOverlay(tag: Int?) -> Int
}
