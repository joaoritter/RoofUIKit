//
//  RoofUIPickerFormButtonSheetView.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 7/24/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import Former
import Spring

/// A button sheet associated with a preview row.
class RoofUIOverlayPickerFormButtonSheetView: RoofUIFormButtonSheetView {
    
    //MARK: public vars
    
    weak var pickerSectionMaker: RoofUIPickerSectionMaker?

    /// A 'seclect all' toggle.
    lazy var toggleFormer: RoofUISwitchRowFormer<RoofUIFormSwitchTableViewCell> = {
        let former = RoofUISwitchRowFormer<RoofUIFormSwitchTableViewCell>().configure {
            former in
            former.cell.hiddenTopSeperator = true
            former.cell.style_ = TableViewCellSwitchStyle.sectionHeader.value
        }
        
        return former
    }()
    
    /// The section for the pickers.
    lazy var pickerSection: SectionFormer? = {
        return self.pickerSectionMaker?.makePickerSection()
    }()
    
    lazy var toggleSection: SectionFormer? = {
        if let pickerSectionMaker = self.pickerSectionMaker, pickerSectionMaker.hasSelectAllToggle {
            self.toggleFormer.cell.label.text = self.pickerSectionMaker?.titleForToggle
            let toggleSection = SectionFormer(rowFormer: self.toggleFormer)
            return toggleSection
        }
        return nil
    }()
    
    
    //MARK: public funcs
    
    override func makeForm() {
        super.makeForm()

        guard let section = pickerSection else { return }
        
        if let toggleSection = toggleSection {
            former.append(sectionFormer: toggleSection)
        }
        
        former.append(sectionFormer: section)
        
        delay(delay: roofUITimeIntervalShort) {
            [weak self] in
            self?.adjustHeightOfFormAnimated(true)
        }
    }
}
