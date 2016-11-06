//
//  UIViewController+RoofUIControllerShowsActivityIndicator.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 7/31/15.
//  Copyright © 2015 Roof. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController: RoofUIControllerShowsActivityIndicator {
    func showActivityIndicatorWithCompletion(completion: (() -> Void)? = nil) {
        let displayActivityIndicatorOperation = BlockOperation {
            let activityIndicatorModal = RoofUIActivityIndicatorViewController()
            activityIndicatorModal.statusBarHidden = self.prefersStatusBarHidden
            self.present(
                activityIndicatorModal,
                animated: true,
                completion: completion
            )
        }
        displayActivityIndicatorOperation.queuePriority = .normal
        displayActivityIndicatorOperation.qualityOfService = .userInitiated
        OperationQueue.main.addOperation(displayActivityIndicatorOperation)
    }
    
    func hideActivityIndicatorWithCompletion(completion: (() -> Void)?) {
        let hideActivityIndicatorOperation = BlockOperation {
            self.dismiss(
                animated: true,
                completion: completion
            )
        }
        hideActivityIndicatorOperation.queuePriority = .normal
        hideActivityIndicatorOperation.qualityOfService = .userInitiated
        OperationQueue.main.addOperation(hideActivityIndicatorOperation)
    }
}


