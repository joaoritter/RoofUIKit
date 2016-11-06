//
//  RoofUIKeyboardAccessoryViewDelegate.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 6/13/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation

@objc protocol RoofUIKeyboardAccessoryViewDelegate: class {
    @objc optional func didTapLeftButtonOfRoofUIKeyboardAccessoryViewInTextField(textField: RoofUITextField)
    @objc optional func didTapRightButtonOfRoofUIKeyboardAccessoryViewInTextField(textField: RoofUITextField)
}
