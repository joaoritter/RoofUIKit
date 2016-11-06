//
//  RoofUITitlePickerTextFieldRowFormer.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 7/28/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit
import Former

/// A text field with a picker view.
class RoofUITitlePickerTextFieldRowFormer<T: RoofUIFormTitlePickerTextFieldTableViewCell, S>: RoofUIRowFormer<T>, RoofUITextFieldsRowFormer where T: RoofUITextFieldFormableRow {
    
    override var isEnabled: Bool {
        didSet {
            cell.textField.isEnabled = isEnabled
        }
    }
    
    var textFields: [RoofUITextField] {
        return [cell.textField]
    }
    
    weak var pickerListener: UIPickerViewDelegate?
    
    private lazy var observer: Observer<T, S>? = {
        return Observer<T, S>(selectorPickerRowFormer: self)
    }()
    
    /// The available options to pick from.
    var pickerItemSections: [[SelectorPickerItem<S>]] = []
    
    /// The rows that are selected.
    var selectedRows: [Int] = [0] {
        didSet {
            var titleLabelText = ""
            for (index, selectedRow) in self.selectedRows.enumerated() {
                if index != 0 {
                    titleLabelText += " "
                }
                let pickerItem = self.pickerItemSections[index][self.selectedRows[index]]
                titleLabelText += index == 0 ? pickerItem.title : pickerItem.title.lowercased()
                
                if picker.selectedRow(inComponent: index) != selectedRow {
                    picker.selectRow(selectedRow, inComponent: index, animated: true)
                }
                
                pickerListener?.pickerView?(picker, didSelectRow: selectedRow, inComponent: index)
            }
            self.cell.textField.text = titleLabelText
        }
    }
    
    lazy var picker: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self.observer
        picker.dataSource = self.observer
        picker.backgroundColor = roofUINeutralAColor
        return picker
    }()

    override init() {
        super.init()
        self.configure {
            former in
            former.rowHeight = UITableViewAutomaticDimension
            cell.textField.inputView = self.picker
            cell.textField.tintColor = UIColor.clear
        }
    }

    required init(instantiateType: Former.InstantiateType, cellSetup: ((T) -> Void)?) {
        fatalError("init(instantiateType:cellSetup:) has not been implemented")
    }

    open override func cellSelected(indexPath: IndexPath) {
        let textField = cell.textField
        if !textField.isEditing {
            textField.isUserInteractionEnabled = true
            textField.becomeFirstResponder()
        }
    }
}

private class Observer<T: RoofUIFormTitlePickerTextFieldTableViewCell, S>
: NSObject, UIPickerViewDelegate, UIPickerViewDataSource where T: RoofUITextFieldFormableRow {
    
    private weak var selectorPickerRowFormer: RoofUITitlePickerTextFieldRowFormer<T, S>?
    
    init(selectorPickerRowFormer: RoofUITitlePickerTextFieldRowFormer<T, S>?) {
        self.selectorPickerRowFormer = selectorPickerRowFormer
    }
    fileprivate dynamic func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let selectorPickerRowFormer = selectorPickerRowFormer else { return }
        if selectorPickerRowFormer.enabled {
            selectorPickerRowFormer.selectedRows[component] = row
        }
    }
    
    fileprivate dynamic  func numberOfComponents(in pickerView: UIPickerView) -> Int {
        guard let selectorPickerRowFormer = selectorPickerRowFormer else { return 0 }
        return selectorPickerRowFormer.pickerItemSections.count 
    }
    
    fileprivate dynamic  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let selectorPickerRowFormer = selectorPickerRowFormer else { return 0 }
        return selectorPickerRowFormer.pickerItemSections[component].count
    }
    
    fileprivate dynamic  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let selectorPickerRowFormer = selectorPickerRowFormer else { return nil }
        return selectorPickerRowFormer.pickerItemSections[component][row].title
    }
    
    fileprivate dynamic  func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = RoofUIPickerRowLabel()

        label.frame = CGRect(x: 0, y: 0, width: pickerView.frame.size.width/2, height: 44);
        label.text = pickerView.delegate?.pickerView?(pickerView, titleForRow: row, forComponent: component)
        label.style_ = RoofUITextStyleThinLargeBlueA()

        if selectorPickerRowFormer?.pickerItemSections.count == 1 {
            label.textAlignment = .center
        }
        else if component == 0 {
            label.textAlignment = .right
        }
        else if let selectorPickerRowFormer = selectorPickerRowFormer, component == selectorPickerRowFormer.pickerItemSections.count - 1 {
            label.textAlignment = .left
        }
        else {
            label.textAlignment = .center
        }
        return label
    }
    
    
}

class RoofUIPickerRowLabel: RoofUILabel {
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 20)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
}
