//
//  RoofUITableController.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 5/9/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation

///Protocol for a controller with a table.
@objc protocol RoofUITableController: class {
    var table: RoofUITableView { get }
}


extension RoofUITableController {
    
    /// Sets the table view properties.
    func setupTable() {
        table.register(
            RoofUITableViewCCell.self,
            forCellReuseIdentifier: RoofUITableViewCellType.segue.stringValue
        )
        table.register(
            RoofUITableViewBCell.self,
            forCellReuseIdentifier: RoofUITableViewCellType.status.stringValue
        )
        table.register(
            RoofUITableSectionHeaderView.self,
            forHeaderFooterViewReuseIdentifier: RoofUITableViewSectionHeaderType.labeled.stringValue
        )
        table.register(
            RoofUITableSectionHeaderDescriptionView.self,
            forHeaderFooterViewReuseIdentifier: RoofUITableViewSectionHeaderType.description.stringValue
        )
        table.register(
            RoofUITableViewACell.self,
            forCellReuseIdentifier: RoofUITableViewCellType.action.stringValue
        )
        table.register(
            RoofUITableViewDCell.self,
            forCellReuseIdentifier: RoofUITableViewCellType.detail.stringValue
        )
    }
}
