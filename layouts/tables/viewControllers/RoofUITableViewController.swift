//
//  LayerDynamicTableViewController.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 4/25/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit


///A roof view controller with a table.
class RoofUITableViewController: RoofUITableViewController_, RoofUITableController {
    
    //MARK: public vars
    
    var table: RoofUITableView {
        return tableView as! RoofUITableView
    }


    //MARK: private vars
    
    ///The style of the table.
    private let tableStyle: RoofUITableViewStyle?

    
    //MARK: init

    init(leftButtonType: RoofUILeftNavigationBarButtonType = .none, rightButtonType: RoofUIRightNavigationBarButtonType = .none, style: RoofUINavigationBarStyle? = RoofUINavigationBarStyleDefault(), tableStyle: RoofUITableViewStyle = RoofUITableViewStyleDefault(), shouldShowSplashAnimation: Bool = false) {
        self.tableStyle = tableStyle
        super.init(
            leftButtonType: leftButtonType,
            rightButtonType: rightButtonType,
            style: style,
            shouldShowSplashAnimation: shouldShowSplashAnimation
        )
    }
    
    /// Unused, but required.
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    //MARK: public funcs
    
    override func loadView() {
        tableView = RoofUITableView(
            frame: UIScreen.main.bounds,
            style: tableStyle
        )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        (navigationController as? RoofUINavigationController)?.addShadow()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        (navigationController as? RoofUINavigationController)?.removeShadow()
    }
    
    /// Sets up the controller's properties.
    override func setup() {
        super.setup()
        setupTable()
        setupDelegatesAndDataSources()
        ///Clear the top padding.
        table.tableHeaderView = UIView(frame: CGRect(x: 0,y: 0,width: 0.01,height: 0.01))
    }
    
    /// Sets the table view delegate and data source.
    func setupDelegatesAndDataSources() {
        table.delegate = self
        table.dataSource = self
    }
    
    
    ///CANT PUT THESE IN EXTENSIONS BECAUSE THEY WILL BE OVERRIDEN.
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
