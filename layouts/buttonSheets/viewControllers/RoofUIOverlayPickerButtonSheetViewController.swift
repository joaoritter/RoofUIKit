//
//  RoofUIPickerButtonSheetViewController.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 7/24/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit
import Former

import Spring

class RoofUIOverlayPickerButtonSheetViewController: RoofUIFormButtonSheetViewController {
    
    weak var dataSource: RoofUIPickerOverlayButtonSheetControllerDataSource?
    weak var previewRowFormer: RoofUIPreviewRowFormer<RoofUIFormPreviewTableViewCell>?
    
    var hasSelectAllToggle: Bool {
        guard let previewRowFormer = previewRowFormer else { return false }
        if previewRowFormer.pickerItems.count == 1 { return false }
        return !previewRowFormer.isRadioSection
    }
    var titleForToggle: String? {
        return previewRowFormer?.toggleTitle
    }
    
    ///A tag to identify the type of overlay.
    var tag: Int?
    
    ///Height adjustment function.
    var didSet: (() -> Void)?
    
    ///MARK: private vars
    
    private let verticalPadding: CGFloat = roofUIMarginD
    private let horizontalPadding: CGFloat = roofUIMarginD

    init(leftButtonType: RoofUILeftNavigationBarButtonType = .check, rightButtonType: RoofUIRightNavigationBarButtonType = .none, buttonSheetStyle: RoofUIButtonSheetFormStyle = RoofUIButtonSheetFormStyleDefault()) {
        super.init(
            leftButtonType: .check,
            rightButtonType: rightButtonType,
            buttonSheetStyle: buttonSheetStyle
        )
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        view = RoofUIOverlayPickerFormButtonSheetView(
            frame: UIScreen.main.bounds,
            style: buttonSheetStyle
        )
        (view as? RoofUIOverlayPickerFormButtonSheetView)?.pickerSectionMaker = self
    }
    
    override func setup() {
        super.setup()
        
        guard let overlayPickerFormButtonSheetView = view as? RoofUIOverlayPickerFormButtonSheetView else { return }
        
        overlayPickerFormButtonSheetView.toggleFormer.switchHandler = {
            switched in
            if switched {
                guard let pickerSection = overlayPickerFormButtonSheetView.pickerSection else { return }
                overlayPickerFormButtonSheetView.former.removeUpdate(
                    sectionFormer: pickerSection,
                    rowAnimation: .top
                )
            }
            else {
                guard let toggleSection = overlayPickerFormButtonSheetView.toggleSection, let pickerSection = overlayPickerFormButtonSheetView.pickerSection else { return }
                
                overlayPickerFormButtonSheetView.incrementHeightOfFormAnimated(pickerSection.rowFormers.count, animated: true)

                overlayPickerFormButtonSheetView.former.insertUpdate(
                    sectionFormer: pickerSection,
                    below: toggleSection,
                    rowAnimation: .top
                )
                
                
                if self.previewRowFormer?.selectedPickerItems.count == self.previewRowFormer?.pickerItems.count {
                    (overlayPickerFormButtonSheetView.pickerSection?.firstRowFormer as? RoofUICheckRowFormer<RoofUIFormCheckTableViewCell>)?.uncheck()
                }
            }
            
            delay(delay: roofUITimeIntervalLong) {
                overlayPickerFormButtonSheetView.adjustHeightOfFormAnimated(true)
            }
        }
        
        if let previewRowFormer = previewRowFormer, hasSelectAllToggle && previewRowFormer.selectedPickerItems.count == previewRowFormer.pickerItems.count {
            overlayPickerFormButtonSheetView.toggleFormer.isOn = true
        }
    }
    
    override func actionForLeftBarButtonItem() {
        guard let overlayView = self.buttonSheet as? RoofUIOverlayPickerFormButtonSheetView,
            let pickerSection = overlayView.pickerSection else { return }
        
        var selectedRows = [Int]()
        
        defer {
            didSet?()
            super.actionForLeftBarButtonItem()
        }
        
        for (j, row) in pickerSection.rowFormers.enumerated() {
            guard let checkRow = row as? RoofUICheckRowFormer<RoofUIFormCheckTableViewCell> else { return }
            if checkRow.checked || overlayView.toggleFormer.cell.toggleSwitch.isOn {
                selectedRows.append(j)
            }
        }
        self.previewRowFormer?.selectedPickerItems = selectedRows
    }
    
    override func numberOfButtonsInRoofUIButtonSheet(buttonSheet: RoofUIButtonSheetView) -> Int {
        return 0
    }
    
    override func textForRoofUIFormButtonSheet(formButtonSheet: RoofUIFormButtonSheetView) -> String? {
        return self.dataSource?.titleTextInOverlay(tag: self.tag)
    }
}
