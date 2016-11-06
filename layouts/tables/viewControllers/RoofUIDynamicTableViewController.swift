//
//  DynamicTableLayerViewController.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 4/25/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit
import Spring


///A tableViewController that has updatable data and supports pullToRefresh.
class RoofUIDynamicTableViewController: RoofUITableViewController, RoofUIDynamicTableController{
    
    //MARK: PUBLICE INSTANCE METHODS
    var pageSize = 20
    
    private var lastVisibleIndexPathBeforeReload: IndexPath?
    
    //MARK: private funcs
    
    private let bottomReloadDistance = roofUIMarginD

    private var hasLoadedPageOnce = false
    
    private var numberOfRowsInSectionBeforePaging: Int?

    //MARK: public funcs
    
    /// Sets up the controller's properties.
    override func setup() {
        super.setup()
        
        self.refreshControl = UIRefreshControl()
        setupPullToRefresh()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        refreshControl?.endRefreshing()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        refreshControl?.endRefreshing()
    }
    
    /**
     
     Protocol method to refresh the dynamic data.
     
     */
    func refreshData() {
        ApplicationState.sharedInstance.refreshDataWithCompletion() {
            [weak self] in
            self?.refreshControl?.endRefreshing()
        }
    }
    
    ///Load more pages of data.
    func pageData() {
        guard tableView.numberOfSections > 0 else { return }
        numberOfRowsInSectionBeforePaging = tableView.numberOfRows(inSection: tableView.numberOfSections - 1)
        if let lastVisibleCell = table.visibleCells.last, hasLoadedPageOnce {
            lastVisibleIndexPathBeforeReload = table.indexPath(for: lastVisibleCell)
        }
    }
    
    func donePagingData() {
        guard tableView.numberOfSections > 0 else { return }

        ///If no new cells were added, return.
        guard let numberOfRowsInSectionBeforePaging = numberOfRowsInSectionBeforePaging, tableView.numberOfRows(inSection: tableView.numberOfSections - 1) > numberOfRowsInSectionBeforePaging else { return }

        delay(delay: roofUITimeIntervalStandard) {
            OperationQueue.main.addOperation {
                [weak self] in
                guard let offset = self?.table.contentOffset, offset.y > 0 else { return }                
                
                self?.hasLoadedPageOnce = true
                if let lastVisibleIndexPathBeforeReload = self?.lastVisibleIndexPathBeforeReload {
                    self?.tableView?.scrollToRow(
                        at: lastVisibleIndexPathBeforeReload,
                        at: .bottom,
                        animated: false
                    )
                }
            }
        }
    }
    
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offset = scrollView.contentOffset
        
        guard offset.y > 0 else { return }
        
        let bounds = scrollView.bounds
        let size = scrollView.contentSize
        let inset = scrollView.contentInset
        let y = offset.y + bounds.size.height - inset.bottom
        let h = size.height
        let reloadDistance = bottomReloadDistance
        if y > h + reloadDistance {
            pageData()
        }
    }
}
