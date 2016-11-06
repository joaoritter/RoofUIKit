//
//  RoofUIButtonTableHeaderDelegate.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 7/1/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation

protocol RoofUIButtonTableHeaderFooterViewDelegate: class {
    func didTapButtonAtIndex(_ index: Int, inButtonTableHeaderFooterView buttonTableHeaderFooterView: RoofUIButtonTableHeaderFooterView)
}
