//
//  RoofUIActivtyIndicatorViewController.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 2/13/15.
//  Copyright (c) 2015 Roof. All rights reserved.
//

import UIKit

class RoofUIActivityIndicatorViewController: UIViewController {
    
    //MARK: public vars

    var activityIndicator: RoofUIActivityIndicatorView {
        return view as! RoofUIActivityIndicatorView
    }
    
    var statusBarHidden: Bool = false
    
    //MARK: private vars

    private var transitioner = RoofUIActivityIndicatorTransitioner()
    
    
    //MARK: init
    
    init() {
        super.init(
            nibName: nil,
            bundle: nil
        )
        modalPresentationStyle = .custom
        transitioningDelegate = transitioner
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///Save the original app tint.
    var windowTintToRestor: UIColor?
    
    //MARK: public funcs

    override var prefersStatusBarHidden : Bool {
        return statusBarHidden
    }
    
    override func loadView() {
        view = RoofUIActivityIndicatorView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.setup()
        windowTintToRestor = (UIApplication.shared.delegate as? AppDelegate)?.window?.tintColor
        (UIApplication.shared.delegate as? AppDelegate)?.window?.tintColor = UIColor.clear
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        (UIApplication.shared.delegate as? AppDelegate)?.window?.tintColor = windowTintToRestor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
