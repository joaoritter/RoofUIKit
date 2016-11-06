//
//  RoofUIConfirmationButtonSheetControllerDelegate.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 7/24/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation

protocol RoofUIOverlayButtonSheetControllerDelegate: class {
    func didConfirmInOverlay(tag: OverlayTag?)
}

protocol RoofUIPickerOverlayButtonSheetControllerDelegate: class {
    func didConfirmInOverlay(tag: Int?)
}
