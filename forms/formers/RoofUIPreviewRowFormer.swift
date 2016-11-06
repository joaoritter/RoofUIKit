//
//  RoofUIPreviewRowFormer.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 7/25/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit
import Former

///A form row that transitions to an auxiliary page to make selections.
class RoofUIPreviewRowFormer<T: RoofUIFormPreviewTableViewCell>: RoofUIRowFormer<T> where T: RoofUIPreviewFieldFormableRow {
    
    /// The picker items
    var pickerItems = [String]()
    
    ///The selected options.
    var selectedPickerItems = [Int]() {
        didSet {
            self.cell.content = self.contentText?(self.selectedPickerItems.sorted(by: {$0 < $1}), pickerItems)
            self.former?.reload(rowFormer: self)
        }
    }
    
    /// The title for the toggle, if the picker view has a toggle.
    var toggleTitle = "All options"
    
    /// If more than one option can be selected.
    var isRadioSection: Bool = false
    
    /// If no checks is an option.
    var allowsNoChecks: Bool = false
    
    /// Dependent sections. Section at index Int depends on the selection of the row at index path
    var dependencies = [(Int, IndexPath)]()
    
    /// The sections of pickers.
    var sections = [JSON]()
    
    /// The function to run to make the label text.
    var contentText: (([Int], [String]) -> String?)?
    
    override init() {
        super.init()
        
        ///Default to appending each option seperated by commas.
        contentText = {
            selectedRows, pickerItems in
            
            if selectedRows.count == pickerItems.count && !self.isRadioSection {
                return self.toggleTitle
            }
            
            var result = ""
            for (index, row) in selectedRows.enumerated() {
                guard let selectedPickerItem = pickerItems.get(row) else { continue }
                
                if index == 0 {
                    result += selectedPickerItem
                }
                else if index == selectedRows.count - 1 {
                    if selectedRows.count == 2 {
                        result += " and \(selectedPickerItem)"
                    }
                    else {
                        result += ", and \(selectedPickerItem)"
                    }
                }
                else {
                    result += ", \(selectedPickerItem)"
                }
            }
            
            return result
        }
    }
    
    required init(instantiateType: Former.InstantiateType, cellSetup: ((T) -> Void)?) {
        fatalError("init(instantiateType:cellSetup:) has not been implemented")
    }
}
