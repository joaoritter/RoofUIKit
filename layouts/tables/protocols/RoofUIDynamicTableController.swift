//
//  DynamicTableController.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 4/25/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation

///Protocol for tables with dynamic data that support pull-to-refresh.
@objc protocol RoofUIDynamicTableController: RoofUITableController {
    func refreshData()
    var refreshControl: UIRefreshControl? { get }
}


extension RoofUIDynamicTableController {
    
    /// Configures the table's pull-to-refresh feature.
    func setupPullToRefresh() {
        self.refreshControl?.backgroundColor = roofUINeutralAColor
        self.refreshControl?.tintColor = roofUINeutralDColor
        self.refreshControl?.addTarget(
            self,
            action: #selector(refreshData),
            for: .valueChanged
        )
    }
}
