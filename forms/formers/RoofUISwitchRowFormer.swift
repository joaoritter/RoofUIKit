//
//  RoofUISwitchRowFormer.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 7/12/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit
import Former

///A form row with a switch
class RoofUISwitchRowFormer<T: RoofUIFormSwitchTableViewCell>: RoofUIRowFormer<T> where T: RoofUISwitchFormableRow {
    
    override var isEnabled: Bool {
        didSet {
            cell.toggleSwitch.isEnabled = isEnabled
        }
    }
    
    /// If the switch is on.
    var isOn: Bool {
        get {
            return cell.toggleSwitch.isOn
        }
        set {
            cell.toggleSwitch.setOn(newValue, animated: true)
            switchHandler?(cell.toggleSwitch.isOn)
        }
    }
    
    ///A function to run when switched.
    var switchHandler: ((Bool) -> Void)?
    
    override init() {
        super.init()
        
        self.configure {
            former in
            former.cell.toggleSwitch.addTarget(
                self,
                action: #selector(didToggle),
                for: .valueChanged
            )
        }
    }

    required init(instantiateType: Former.InstantiateType, cellSetup: ((T) -> Void)?) {
        fatalError("init(instantiateType:cellSetup:) has not been implemented")
    }
    
    dynamic func didToggle() {
        UIApplication.topViewController()?.view.endEditing(true)
        switchHandler?(cell.toggleSwitch.isOn)
    }
    
    /// Handler for toggling the switch when the row is selected.
    override func cellSelected(indexPath: IndexPath) {
        former?.deselect(animated: true)
        
        guard enabled else { return }
        
        let switchButton = cell.toggleSwitch
        isOn = !switchButton.isOn
        UIApplication.topViewController()?.view.endEditing(true)
    }
}
