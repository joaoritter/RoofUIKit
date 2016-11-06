//
//  RoofUIOverlayButtonSheetViewController+PickerSectionMaker.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 7/25/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import Former

extension RoofUIOverlayPickerButtonSheetViewController: RoofUIPickerSectionMaker {
    
    /// Makes the view's pickers.
    func makePickerSection() -> SectionFormer? {
        guard let previewRowFormer = self.previewRowFormer else { return nil }
        
        var optionFormers = [RoofUICheckRowFormer<RoofUIFormCheckTableViewCell>]()
        
        for (j, rowValue) in previewRowFormer.pickerItems.enumerated() {
            let former = RoofUICheckRowFormer<RoofUIFormCheckTableViewCell>().configure {
                former in
                former.cell.label.text = rowValue
                if previewRowFormer.selectedPickerItems.contains(j) {
                    former.check()
                }
                if (j == 0) {
                    former.cell.hiddenTopSeperator = false
                }
                former.cell.style_ = RoofUITableViewCellCheckStyleDefault()
                former.allowsNoChecks = previewRowFormer.allowsNoChecks
                former.isRadioSection = previewRowFormer.isRadioSection
                former.isAlone = previewRowFormer.pickerItems.count == 1
            }
            optionFormers.append(former)
        }
        
        let optionsSection = SectionFormer(
            rowFormers: optionFormers
            ).set(headerViewFormer: nil).set(footerViewFormer: nil)
        
        for optionFormer in optionFormers {
            optionFormer.section = optionsSection
            optionFormer.section = optionsSection
        }
        
        return optionsSection
    }
}
