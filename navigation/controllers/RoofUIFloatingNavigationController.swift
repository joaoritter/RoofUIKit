//
//  RoofFloatingNavigationController.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 10/21/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import UIKit

class RoofUIFloatingNavigationController: RoofUINavigationController {
    
    weak var controllerToDimUponPresenting: RoofUINavigationController?

    private let bottomButtonHeight = roofUIFloatingNavigationButtonHeight
    private let paddingBottom = roofUIMargin0
    private let bottomButton = UIButton()
    private let bottomAuxButton = UIButton()
    private let buttonBackgroundColor = roofUINeutralAColor.withAlphaComponent(0.6)
    private let secondaryuttonBackgroundColor = roofUINeutralAColor.withAlphaComponent(0.2)

    override func viewDidLoad() {
        super.viewDidLoad()
        modalPresentationStyle = .overCurrentContext
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        controllerToDimUponPresenting?.dim(.in)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        controllerToDimUponPresenting?.dim(.out)
    }

    
    /// Goes to the root.
    override func resetToController(_ rootController: UIViewController) {
        let controller = presentingViewController
        presentingViewController?.dismiss(animated: true) {
            (controller as? RoofUINavigationController)?.resetToController(rootController)
        }
    }
    
    override func setup() {
        super.setup()
        setNavigationBarHidden(true, animated: false)
        makeNavigationButtons()
    }

    func navigationController(_ navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
        if viewController is RoofUIActivityIndicatorViewController { return }

        if let image = (viewController.navigationItem.leftBarButtonItem?.customView as? UIButton)?.imageView?.image {
            bottomButton.isHidden = false
            bottomButton.setImage(image, for: UIControlState())
            bottomButton.addTarget(self, action: #selector(bottomButtonAction), for: .touchUpInside)
        }
        else {
            bottomButton.isHidden = true
        }
        
        if let image = (viewController.navigationItem.rightBarButtonItem?.customView as? UIButton)?.imageView?.image {
            bottomAuxButton.isHidden = false
            bottomAuxButton.setImage(image, for: UIControlState())
            bottomAuxButton.addTarget(self, action: #selector(bottomButtonAuxAction), for: .touchUpInside)
        }
        else {
            bottomAuxButton.isHidden = true
        }
    }

    override func fadeToController(_ rootController: UIViewController) {
        let presentingViewController = self.presentingViewController as? RoofUINavigationController
        
        presentingViewController?.dismiss(animated: true, completion: nil)
        presentingViewController?.fadeToController(rootController)

    }
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?) {
        let presentingViewController = self.presentingViewController
        
        presentingViewController?.dismiss(animated: flag) {
            presentingViewController?.present(viewControllerToPresent, animated: flag, completion: completion)
        }
    }
    
    func bottomButtonAction() {
        guard let topViewController = topViewController as? RoofUIButtonSheetViewController else { return }
        topViewController.actionForLeftBarButtonItem()
    }
    
    func bottomButtonAuxAction() {
        guard let topViewController = topViewController as? RoofUIButtonSheetViewController else { return }
        topViewController.actionForRightBarButtonItem()
    }
    
    private func makeNavigationButtons() {
        bottomButton.frame = CGRect(x: 0,y: view.frame.height - bottomButtonHeight - paddingBottom,width: bottomButtonHeight,height: bottomButtonHeight)
        bottomButton.layer.cornerRadius = bottomButtonHeight * 0.5
        bottomButton.backgroundColor = buttonBackgroundColor
        
        bottomButton.center.x = view.center.x

        
        bottomButton.layer.shadowPath = UIBezierPath(rect: bottomButton.frame).cgPath
        bottomButton.layer.shadowColor = roofUIButtonSheetShadowColor.cgColor
        bottomButton.layer.shadowOffset = roofUIButtonSheetShadowOffset
        bottomButton.layer.shadowOpacity = roofUIButtonSheetShadowOpacity
        bottomButton.layer.shadowRadius = roofUIButtonSheetShadowRadius
        
        bottomAuxButton.frame = CGRect(x: view.frame.width - roofUIMarginC - bottomButtonHeight,y: view.frame.height - bottomButtonHeight - paddingBottom,width: bottomButtonHeight,height: bottomButtonHeight)
        bottomAuxButton.layer.cornerRadius = bottomButtonHeight * 0.5
        bottomAuxButton.backgroundColor = secondaryuttonBackgroundColor
        
        bottomAuxButton.layer.shadowPath = UIBezierPath(rect: bottomButton.frame).cgPath
        bottomAuxButton.layer.shadowColor = roofUIButtonSheetShadowColor.cgColor
        bottomAuxButton.layer.shadowOffset = roofUIButtonSheetShadowOffset
        bottomAuxButton.layer.shadowOpacity = roofUIButtonSheetShadowOpacity
        bottomAuxButton.layer.shadowRadius = roofUIButtonSheetShadowRadius
        
        view.addSubview(bottomAuxButton)
        view.addSubview(bottomButton)
    }
}
