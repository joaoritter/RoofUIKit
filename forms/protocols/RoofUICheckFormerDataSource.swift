//
//  RoofUICheckFormerDataSource.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 6/13/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation

protocol RoofUICheckFormerDataSource: class {
    func numCheckFormersInSectionAtIndex(sectionIndex: Int) -> Int
    func nameForCheckFormerAtIndex(rowIndex: Int, ofSectionAtIndex sectionIndex: Int) -> String?
    func checkFormerIsCheckedAtIndex(rowIndex: Int, ofSectionAtIndex sectionIndex: Int) -> Bool
}