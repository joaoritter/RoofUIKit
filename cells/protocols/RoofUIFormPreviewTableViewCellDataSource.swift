//
//  RoofUISelectorPickerTableViewCellDelegate.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 7/24/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit

protocol RoofUIFormPreviewTableViewCellDataSource: class {
    func numberOfOptionsForPreviewCellAtIndex(index: Int) -> Int
    func titleForOptionAtIndex(rowIndex: Int, ofSectionAtIndex sectionIndex: Int) -> String?
    func checkFormerIsCheckedAtIndex(rowIndex: Int, ofSectionAtIndex sectionIndex: Int) -> Bool
}