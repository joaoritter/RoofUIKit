//
//  RoofUIFormButtonSheetViewController+PreviewRowFormerNavigator.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 7/25/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation

import Spring

extension RoofUIFormButtonSheetViewController: RoofUIPreviewRowFormerNavigator {
   
    /// Show overlay.
    func showOverlayForPreivewRowFormer(previewRowFormer: RoofUIPreviewRowFormer<RoofUIFormPreviewTableViewCell>) {
        let overlayController = RoofUIOverlayPickerButtonSheetViewController()
        overlayController.tag = previewRowFormer.cell.tag
        overlayController.dataSource = self
        overlayController.previewRowFormer = previewRowFormer
        overlayController.didSet = {
            /// Need delay for proper sizing.
            delay(delay: roofUITimeIntervalLong) {
                (self.buttonSheet as? RoofUIFormButtonSheetView)?.adjustHeightOfFormAnimated(true)
            }
        }
        navigationController?.pushViewController(overlayController, animated: true)
    }
}
