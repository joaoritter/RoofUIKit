//
//  RoofUIFieldButtonSheetViewController.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 5/22/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import Spring
import Former
import AudioToolbox

class RoofUIFormButtonSheetViewController: RoofUIButtonSheetViewController, RoofUIPickerOverlayButtonSheetControllerDelegate, RoofUIPickerOverlayButtonSheetControllerDataSource,  RoofUIOverlayButtonSheetControllerDelegate, RoofUIOverlayButtonSheetControllerDataSource,
    RoofUIFormButtonSheetDataSource {

    //MARK: public vars
    var formButtonSheet: RoofUIFormButtonSheetView {
        return view as! RoofUIFormButtonSheetView
    }
    
    ///The text field currently active.
    var activeField: RoofUITextField? = nil {
        didSet {
            guard let _ = activeField else { return }
            state = .normal
        }
    }
    
    var keyboardShowing = false
    
    var ctaText: String? {
        return roofUIButtonSheet(buttonSheet: buttonSheet, titleForButtonAtIndex: 0)
    }
    
    ///The button sheet's errorState.
    var state: RoofUIFormState = .normal{
        didSet {
            switch state {
            case .error(let message):
                showButtonAlertWithMessage(message: message)
            case .success(let message):
                showButtonAlertWithMessage(message: message, negative: false)
            case .normal:
                resetFormState()
            }
            ///Animate shake and button color change.
        }
    }
    
    
    //MARK: private vars

    private var buttonStyleBuffer = [RoofUIButtonStyle?]()
    
    
    //MARK: public funcs

    override func loadView() {
        super.loadView()
        view = RoofUIFormButtonSheetView(
            frame: UIScreen.main.bounds,
            style: buttonSheetStyle
        )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        buttonSheet.buttonsView.buttons.first?.showAnimated(animated: false)
        setupKeyboardObservers()
    
        ///If this is the first view controller in the navigation controller, select before the view appears.
        if navigationController?.viewControllers.first == self {
            autoSelect()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        ///If this is not the first view controller in the navigation controller, wait till the view has appeared.
        if navigationController?.viewControllers.first != self {
            autoSelect()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    func keyboardWillAppear() {
        buttonSheet.buttonsView.buttons.first?.isHidden = true

        ///Only raise once.
        guard !keyboardShowing else { return }
        keyboardShowing = true
        buttonSheet.raiseAnimated()
    }
    
    func keyboardWillDisappear() {
        guard keyboardShowing else { return }
        buttonSheet.buttonsView.buttons.first?.showAnimated(animated: true)
    }
    
    func keyboardDidDisappear() {
        guard keyboardShowing else { return }
        if activeField == nil {
            keyboardShowing = false
        }
    }

    override func setup() {
        super.setup()
        makeForm()
        setAccessoryViewDelegate()
        (self.buttonSheet as? RoofUIFormButtonSheetView)?.adjustHeightOfFormAnimated(false)
    }

    
    func makeForm() {}
    
    /// Visual indication of an error.
    func showButtonAlertWithMessage(message: String, negative: Bool = true) {
        OperationQueue.main.addOperation {
            
            guard let primaryButton = self.buttonSheet.buttonsView.buttons.first else { return }
            
            ///Disable the primary button.
            primaryButton.isEnabled = false
            primaryButton.primaryLabel.text = message
            
            if negative {
                primaryButton.backgroundColor = roofUIAlertColor
                self.buttonStyleBuffer.append(primaryButton.style_)
                primaryButton.style_ = ButtonStyle.yellow.value
                
                self.buttonSheet.contentView.animation = "shake"
                self.buttonSheet.contentView.curve = "spring"
                self.buttonSheet.contentView.duration = 1
                self.buttonSheet.contentView.y = 10
                self.buttonSheet.contentView.x = 5
                self.buttonSheet.contentView.animate()
                AudioServicesPlayAlertSound(UInt32(kSystemSoundID_Vibrate))
            }
        }
    }
    
    func setAccessoryViewDelegate() {
        for rowFormer in formButtonSheet.former.rowFormers {
            if let textFieldsRowFormer = rowFormer as? RoofUITextFieldsRowFormer {
                for textField in textFieldsRowFormer.textFields {
                    textField.delegate = self
                    textField.accessoryViewDelegate = self
                }
            }
        }
    }

    
    func titleTextInOverlay(tag: Int?) -> String? {
        return "Choose"
    }

    func numberOfSectionsInOverlay(tag: Int?) -> Int {
        return 1
    }
    
    func didConfirmInOverlay(tag: Int?) {}
    
    func titleTextInOverlay(tag: OverlayTag?) -> String? {
        return "Choose"
    }
    
    func confirmationButtonTextInOverlay(tag: OverlayTag?) -> String? {
        return "Done"
    }
    
    func didConfirmInOverlay(tag: OverlayTag?) {}
    
    func numberOfInstructionsInRoofUIFormButtonSheet(formButtonSheet: RoofUIFormButtonSheetView) -> Int {
        return 1
    }
    
    func imageForRoofUIFormButtonSheet(formButtonSheet: RoofUIFormButtonSheetView) -> UIImage? {
        return nil
    }
    
    func widthForImageInRoofUIFormButtonSheet(formButtonSheet: RoofUIFormButtonSheetView) -> CGFloat {
        return roofUIImageStandardWidth
    }
    
    func textForRoofUIFormButtonSheet(formButtonSheet: RoofUIFormButtonSheetView) -> String? {
        return nil
    }
    
    func subtextForRoofUIFormButtonSheet(formButtonSheet: RoofUIFormButtonSheetView) -> String? {
        return nil
    }
    
    //MARK: private funcs
    private func resetFormState() {
        guard let primaryButton = buttonSheet.buttonsView.buttons.first else { return }
        
        primaryButton.isEnabled = true
        
        if let bufferStyle = buttonStyleBuffer.last {
            primaryButton.style_ = bufferStyle
        }
        
        if let index = buttonSheet.buttonsView.buttons.index(of: primaryButton) {
            let title = buttonSheet.dataSource?.roofUIButtonSheet(buttonSheet: buttonSheet, titleForButtonAtIndex: index)
            primaryButton.primaryLabel.text = title
        }
    }
    
    private func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidDisappear), name: NSNotification.Name.UIKeyboardDidHide, object: nil)
    }
    
    private func autoSelect() {
        for rowFormer in formButtonSheet.former.rowFormers {
            guard let roofRowFormer = rowFormer as? RoofUISelectableRowFormer else { continue }
            if roofRowFormer.shouldSelectOnLoad {
                formButtonSheet.former.select(
                    rowFormer: rowFormer,
                    animated: true
                )
                return
            }
        }
    }
}
