//
//  RoofUIButtonSheetDelegate.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 5/9/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation

///The data source for the button sheet.
protocol RoofUIButtonSheetDelegate: class {
    func roofUIButtonSheet(buttonSheet: RoofUIButtonSheetView, didTapButtonAtIndex index: Int)    
}
