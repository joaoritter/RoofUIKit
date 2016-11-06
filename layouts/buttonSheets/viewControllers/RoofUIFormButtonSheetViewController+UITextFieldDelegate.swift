//
// RoofUIFormButtonSheetView+UITextFieldDelegate.swift
// Roof
//
// Created by João Victor de Souza Ritter on 6/2/16.
// Copyright © 2016 Roof. All rights reserved.
//
import Foundation
import UIKit
import Former

extension RoofUIFormButtonSheetViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let formButtonSheet = buttonSheet as? RoofUIFormButtonSheetView else { return true }
        
        guard let roofTextField = textField as? RoofUITextField else { return true }
        
        ///MAKE ALL TF CELLS CONFORM TO A PROTOCOL.
        let textFieldRowFormers = formButtonSheet.former.rowFormers.filter({
            $0 is RoofUITextFieldsRowFormer
        })
        
        var fields = [(RowFormer, RoofUITextField)]()
        for rowFormer in textFieldRowFormers {
            if let textFields = (rowFormer as? RoofUITextFieldsRowFormer)?.textFields {
                for field in textFields {
                    fields.append((rowFormer, field))
                }
            }
        }
        
        if let index = fields.map({$0.1}).index(of: roofTextField) {
            //check for empty subsequent fields
            for i in index+1..<fields.count {
                let subsequentRoofTextFormer = fields[i].0
                if let textFieldRowFormer = subsequentRoofTextFormer as? RoofUITextFieldsRowFormer {
                    for field in textFieldRowFormer.textFields {
                        if field.text == "" {
                            subsequentRoofTextFormer.former?.select(
                                rowFormer: subsequentRoofTextFormer,
                                animated: true,
                                scrollPosition: UITableViewScrollPosition.none
                            )
                            fields[i].1.becomeFirstResponder()
                            return true
                        }
                    }
                }
            }
            //check for empty previous fields
            for i in 0..<index {
                let priorRoofTextFormer = fields[i].0
                if let textFieldRowFormer = priorRoofTextFormer as? RoofUITextFieldsRowFormer {
                    for field in textFieldRowFormer.textFields {
                        if field.text == "" {
                            priorRoofTextFormer.former?.select(
                                rowFormer: priorRoofTextFormer,
                                animated: true,
                                scrollPosition: UITableViewScrollPosition.none
                            )
                            fields[i].1.becomeFirstResponder()

                            return true
                        }

                    }
                }
            }
            formButtonSheet.former.endEditing()
        }
        return true
    }
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        guard let formButtonSheet = buttonSheet as? RoofUIFormButtonSheetView else { return true }

        if let roofTextField = textField as? RoofUITextField {
            formButtonSheet.setReturnKeyTypeForTextField(roofTextField)
        }
        
        let hasEmptyField = formButtonSheet.hasEmptyField(textField)

        (textField.inputAccessoryView as? RoofUIKeyboardAccessoryView)?.rightButtonState = hasEmptyField ? .next : .submit(title: ctaText ?? "Submit")
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = textField.text?.replacingOccurrences(of: " ", with: "\u{00a0}")
        
        guard let roofTextField = textField as? RoofUITextField else { return }
        activeField = roofTextField
        
        switch roofTextField.type {
        case .amount:
            if textField.text?.length == 0 || textField.text == "$0.00" {
                textField.text = (Locale.current as NSLocale).object(forKey: .currencySymbol) as? String
//                textField.text = NSLocale(localeIdentifier: "en_US").objectForKey(NSLocaleCurrencySymbol) as? String
            }
        default: break
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layoutIfNeeded()

        textField.text = textField.text?.replacingOccurrences(of: "\u{00a0}", with: " ")

        guard let roofTextField = textField as? RoofUITextField else { return }
        
        switch roofTextField.type {
        case .amount:
            guard let textFieldText = textField.text else { return }
            
            var text = textFieldText
            
            text.remove(at: text.startIndex)
            
            let amount = Double(text) ?? 0
            
            //Make sure each required property is valid.
//            let newTextString = (NSLocale(localeIdentifier: "en_US").objectForKey(NSLocaleCurrencySymbol) as? String ?? "") + String(format: "%.2f", amount)
            let newTextString = ((Locale.current as NSLocale).object(forKey: .currencySymbol) as? String ?? "") + String(format: "%.2f", amount)

            textField.text = newTextString

        default: break
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        activeField = nil

        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let textField = textField as? RoofUITextField else {
            return true
        }
        
        switch textField.type {
        case .amount:
            guard let text = textField.text else { return true }

            let oldText = text as NSString

            let newText = oldText.replacingCharacters(in: range, with: string) as NSString!
            
            if newText == "$0" && oldText == "$" { return false }
            
            let amountComponents = newText?.components(separatedBy: ".")
            ///There can only be one period.
            let numberOfPeriodOccurances = (amountComponents?.count)! - 1
            if numberOfPeriodOccurances > 1 {
                return false
            }
            
            // Make sure that the currency symbol is always at the beginning of the string:
//            if let string = NSLocale(localeIdentifier: "en_US").objectForKey(NSLocaleCurrencySymbol) as? String where newText.hasPrefix(string) {
                if let string = (Locale.current as NSLocale).object(forKey: .currencySymbol) as? String, (newText?.hasPrefix(string))! {
                let maxLength = 9

                //Dont allow more than 2 chars after a period.
                if (amountComponents?.last?.length)! > 2 && (amountComponents?.count)! > 1 {
                    return false
                }
                if (newText?.length)! <= maxLength {
                    return true
                }
                return false
            }
            else {
                return false
            }

        default:
            if range.location == textField.text?.length && string == " " {
                // ignore replacement string and add your own
                textField.text = (textField.text ?? "") + "\u{00a0}"
                return false
            }
            return true
        }

    }
}
