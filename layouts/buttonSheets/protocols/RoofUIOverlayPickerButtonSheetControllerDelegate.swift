//
//  RoofUIPickerButtonSheetControllerDelegate.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 7/24/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation

protocol RoofUIOverlayPickerButtonSheetControllerDelegate: RoofUIOverlayButtonSheetControllerDelegate {
    func didSavePickerWithSelectedIndexPaths(selectedIndexPaths: [IndexPath])
}
