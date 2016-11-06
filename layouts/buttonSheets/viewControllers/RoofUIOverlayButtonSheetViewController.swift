//
//  RoofUIConfirmationButtonSheetViewController.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 7/11/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit

class RoofUIOverlayButtonSheetViewController: RoofUIFormButtonSheetViewController {
    
    weak var dataSource: RoofUIOverlayButtonSheetControllerDataSource?
    weak var delegate: RoofUIOverlayButtonSheetControllerDelegate?
    
    ///A tag to identify the type of overlay.
    var tag: OverlayTag?
    
    init(leftButtonType: RoofUILeftNavigationBarButtonType = .none, rightButtonType: RoofUIRightNavigationBarButtonType = .none, buttonSheetStyle: RoofUIButtonSheetStyle = RoofUIButtonSheetFormStyleAlert()) {
        super.init(
            leftButtonType: leftButtonType,
            rightButtonType: rightButtonType,
            buttonSheetStyle: buttonSheetStyle
        )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func numberOfButtonsInRoofUIButtonSheet(buttonSheet: RoofUIButtonSheetView) -> Int {
        return 1
    }
    
    override func textForRoofUIFormButtonSheet(formButtonSheet: RoofUIFormButtonSheetView) -> String? {
        return dataSource?.titleTextInOverlay(tag: self.tag)
    }
    
    override func roofUIButtonSheet(buttonSheet: RoofUIButtonSheetView, titleForButtonAtIndex index: Int) -> String? {
        switch index {
        case 0:
            return dataSource?.confirmationButtonTextInOverlay(tag: self.tag)
        default: return nil
        }
    }

    override func roofUIButtonSheet(buttonSheet: RoofUIButtonSheetView, styleForButtonAtIndex index: Int) -> RoofUIButtonStyle? {
        switch index {
        case 0:
            return RoofUIButtonStyleWhiteBordered()
        default: return nil
        }
    }
    
    override func roofUIButtonSheet(buttonSheet: RoofUIButtonSheetView, didTapButtonAtIndex index: Int) {
        switch index {
        case 0:
            self.presentingViewController?.dismiss(animated: true) {
               self.delegate?.didConfirmInOverlay(tag: self.tag)
            }
        default: break
        }
    }
}
