//
//  showsActivityIndicator.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 2/7/15.
//  Copyright (c) 2015 Roof. All rights reserved.
//

import Foundation

@objc protocol RoofUIControllerShowsActivityIndicator {
    func showActivityIndicatorWithCompletion(completion: (() -> Void)?)
    func hideActivityIndicatorWithCompletion(completion: (() -> Void)?)
}
