//
//  RoofUIButtonSheetDataSource.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 5/9/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit

///The data source for the button sheet.
protocol RoofUIButtonSheetDataSource: class {
    func numberOfButtonsInRoofUIButtonSheet(buttonSheet: RoofUIButtonSheetView) -> Int
    func roofUIButtonSheet(buttonSheet: RoofUIButtonSheetView, titleForButtonAtIndex index: Int) -> String?
    func roofUIButtonSheet(buttonSheet: RoofUIButtonSheetView, styleForButtonAtIndex index: Int) -> RoofUIButtonStyle?
}

///The data source for the form button sheet.
protocol RoofUIFormButtonSheetDataSource: RoofUIButtonSheetDataSource {
    func textForRoofUIFormButtonSheet(formButtonSheet: RoofUIFormButtonSheetView) -> String?
    func subtextForRoofUIFormButtonSheet(formButtonSheet: RoofUIFormButtonSheetView) -> String?
    func imageForRoofUIFormButtonSheet(formButtonSheet: RoofUIFormButtonSheetView) -> UIImage?
    func widthForImageInRoofUIFormButtonSheet(formButtonSheet: RoofUIFormButtonSheetView) -> CGFloat
}
