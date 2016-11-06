//
//  RoofUIFormButtonSheetViewController+RoofUIKeyboardAccessoryViewDelegate.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 6/13/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation

extension RoofUIFormButtonSheetViewController: RoofUIKeyboardAccessoryViewDelegate {
    func didTapLeftButtonOfRoofUIKeyboardAccessoryViewInTextField(textField: RoofUITextField) {
        textField.resignFirstResponder()
    }
    func didTapRightButtonOfRoofUIKeyboardAccessoryViewInTextField(textField: RoofUITextField) {
        guard let accessoryView = textField.inputAccessoryView as? RoofUIKeyboardAccessoryView else { return }
      
        switch accessoryView.rightButtonState {
        case .next:
            _ = textFieldShouldReturn(textField)
        case .submit:
            ///Tap the primary button.
            roofUIButtonSheet(
                buttonSheet: self.buttonSheet,
                didTapButtonAtIndex: 0
            )
        }
    }
}
