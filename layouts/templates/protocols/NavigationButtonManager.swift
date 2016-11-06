//
//  NavigationButtonManager.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 11/2/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation


@objc protocol NavigationButtonManager {
    var navigationItem: UINavigationItem { get }
    var navigationController: UINavigationController? { get }
    var view: UIView! { get }
    var presentingViewController: UIViewController? { get }

    func actionForLeftBarButtonItem()
    func actionForRightBarButtonItem()
}

extension NavigationButtonManager {
    
    var barButtonHeight: CGFloat {
        return roofUIBarButtonHeight
    }

    func setupNavigation(leftButtonType: RoofUILeftNavigationBarButtonType, rightButtonType: RoofUIRightNavigationBarButtonType) {
        navigationItem.setHidesBackButton(true, animated: false)
        ///Wordless back button.
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title:"",
            style:.plain,
            target:nil,
            action:nil
        )
        
        setupNavigationEnvironment(
            leftButtonType: leftButtonType,
            rightButtonType: rightButtonType
        )
    }
    
    /// The function run when the leftBarButtonItem is tapped.
    func actionForLeftBarButtonType(leftBarButtonType: RoofUILeftNavigationBarButtonType) {
        switch leftBarButtonType {
        case .close:
            view.endEditing(true)
            presentingViewController?.dismiss(animated: true, completion: nil)
        case .back, .check:
            view.endEditing(true)
            _ = navigationController?.popViewController(animated: true)
        default:
            return
            
        }
    }
    
    /// The function run when the rightBarButtonItem is tapped.
    func actionForRightBarButtonType(rightBarButtonType: RoofUIRightNavigationBarButtonType) {
        switch rightBarButtonType {
            
        case .info, .new, .none, .custom:
            return
        }
    }
    
    /// Sets up the navigatino environment based on the type of view controller this is.
    private func setupNavigationEnvironment(leftButtonType: RoofUILeftNavigationBarButtonType, rightButtonType: RoofUIRightNavigationBarButtonType) {
        
        var leftButtonImage: UIImage?
        var rightButtonImage: UIImage?
        
        switch leftButtonType {
        case .back:
            leftButtonImage = UIImage(named: "back")?.withRenderingMode(.alwaysTemplate)
        case .close:
            leftButtonImage = UIImage(named: "close")?.withRenderingMode(.alwaysTemplate)
        case .check:
            leftButtonImage = UIImage(named: "checkSmall")?.withRenderingMode(.alwaysTemplate)
        case .custom(let image):
            leftButtonImage = image?.withRenderingMode(.alwaysTemplate)
        case .none:
            leftButtonImage = nil
        }
        
        switch rightButtonType {
            
        case .new:
            rightButtonImage = UIImage(named: "add")?.withRenderingMode(.alwaysTemplate)
        case .info:
            rightButtonImage = UIImage(named: "?")?.withRenderingMode(.alwaysTemplate)
        case .none:
            rightButtonImage = nil
        case .custom(let image):
            rightButtonImage = image?.withRenderingMode(.alwaysTemplate)
        }
        
        setBarButtonItemForSide(
            side: .left,
            withImage: leftButtonImage
        )
        
        setBarButtonItemForSide(
            side: .right,
            withImage: rightButtonImage
        )
    }
    
    
    //MARK: private vars
    
    /// Initializes a navigation bar button with appropriate actions and the specified image.

    private func setBarButtonItemForSide(side: RoofUISide, withImage image: UIImage?) {
        
        var barButtonItem: UIBarButtonItem?
        
        ///When this function is finished, set the appropirate bar button item.
        defer {
            switch side {
            case .left:
                self.navigationItem.leftBarButtonItem = barButtonItem
            case .right:
                self.navigationItem.rightBarButtonItem = barButtonItem
            }
        }
        
        
        ///If there is no image, don't make a button.
        guard let image = image else {
            barButtonItem = nil
            return
        }
        
        ///The selector to use when actioning the button.
        let barButtonSelector = side == .left ? #selector(actionForLeftBarButtonItem) : #selector(actionForRightBarButtonItem)
        
        
        ///Make a custom button with the image.
        let button = UIButton(type: .custom)
        button.setImage(
            image,
            for: UIControlState()
        )
        
        ///The image's aspect ratio.
        let aspectRatio = image.size.width / image.size.height
        
        ///Add the left button action as a target.
        button.addTarget(
            self,
            action: barButtonSelector,
            for: .touchUpInside
        )
        
        ///Hard code the button's frame.
        button.frame = CGRect(
            x: 0,
            y: 0,
            width: (barButtonHeight * aspectRatio),
            height: barButtonHeight
        )
        
        ///Set the bar button.
        barButtonItem = UIBarButtonItem(customView: button)
    }
    
    
}
