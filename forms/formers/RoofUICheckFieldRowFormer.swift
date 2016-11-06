//
//  RoofUICheckFieldRowFormer.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 6/12/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit
import Former

/// A row with a check mark.
class RoofUICheckRowFormer<T: RoofUIFormCheckTableViewCell>: RoofUIRowFormer<T> where T: RoofUICheckFormableRow {
    
    //MARK: public vars

    /// The form section to which this row belongs.
    weak var section: SectionFormer?
    
    /// If the row belongs to a radio section.
    var isRadioSection: Bool = false
    
    var isAlone: Bool = false
    
    ///If the section allows no checks.
    var allowsNoChecks: Bool = false
    
    /// If the row is checked.
    var checked = false
    
    /// The check image view.
    lazy var customCheckView: UIImageView = {
        let image = UIImage(named: "check")?.withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(image: image)
        imageView.tintColor = roofUISecondaryColor
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: roofUIFieldAuxiliaryViewSize, height: roofUIFieldAuxiliaryViewSize)
        self.cell.accessoryView = imageView
        return imageView
    }()

    //MARK: private vars
    
    private var sectionHasMultipleChecks: Bool {
    
        guard let section = section else { return false }
        
        var numChecked = 0
        
        for rowFormer in section.rowFormers {
            guard let checkRowFormer = (rowFormer as? RoofUICheckRowFormer) else { continue }
            if checkRowFormer.checked {
                numChecked += 1
            }
        }
        
        return numChecked > 1
    }
    
    private var sectionHasMultipleUnchecked: Bool {
        
        guard let section = section else { return false }
        
        var numChecked = 0
        
        for rowFormer in section.rowFormers {
            guard let checkRowFormer = (rowFormer as? RoofUICheckRowFormer) else { continue }
            if checkRowFormer.checked {
                numChecked += 1
            }
        }
        
        return numChecked < section.rowFormers.count - 1
    }
    
    //MARK: public funcs

    override func cellSelected(indexPath: IndexPath) {
        former?.deselect(animated: true)

        guard isEnabled else { return }
        
        if (!allowsNoChecks && checked && !sectionHasMultipleChecks) { return }
        
        if  (!isRadioSection && !sectionHasMultipleUnchecked && !checked && !isAlone) {
            uncheckOne()
        }
        
        if isRadioSection {
            uncheckAllRadio()
        }
        
        if enabled {
            checked = !checked
            customCheckView.isHidden = !checked
        }
        
        super.cellSelected(indexPath: indexPath)
    }
    
    func check() {
        if isRadioSection {
            uncheckAllRadio()
        }
        customCheckView.isHidden = false
        checked = true
    }
    
    func uncheck() {
        if !allowsNoChecks && !sectionHasMultipleChecks { return }
        
        customCheckView.isHidden = true
        checked = false
    }
    
    //MARK: private funcs
    
    private func uncheckAllRadio() {
        guard let radioSection = section, isRadioSection else { return }

        for rowFormer in radioSection.rowFormers {
            guard let checkRowFormer = (rowFormer as? RoofUICheckRowFormer), checkRowFormer.isRadioSection else { continue }
            checkRowFormer.checked = false
            checkRowFormer.customCheckView.isHidden = true
        }
    }
    
    private func uncheckOne() {
        guard let section = section else { return }
        
        for rowFormer in section.rowFormers {
            guard let checkRowFormer = (rowFormer as? RoofUICheckRowFormer), checkRowFormer.checked else { continue }
            checkRowFormer.checked = false
            checkRowFormer.customCheckView.isHidden = true
            return
        }
    }
}
