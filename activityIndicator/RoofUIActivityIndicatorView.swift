//
//  ActivityIndicatorView.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 2/7/15.
//  Copyright (c) 2015 Roof. All rights reserved.
//

import Foundation
import UIKit

class RoofUIActivityIndicatorView: UIView {
    
    //MARK: private vars

    private let cornerRadius: CGFloat = roofUICornerRadius
    private let color: UIColor = roofUINeutralBColor
    private let spinnerColor: UIColor = roofUINeutralGColor
    private let spinner = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
    private let sideLength: CGFloat = roofUIActivityIndicatorHeight
    
    
    //MARK: init
    
    init() {
        let x = (UIScreen.main.bounds.size.width - sideLength)*0.5
        let y = (UIScreen.main.bounds.size.height - sideLength)*0.5
        super.init(
            frame: CGRect(x: x, y: y, width: sideLength, height: sideLength)
        )
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    //MARK: public funcs

    override func setup() {
        super.setup()
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        backgroundColor = color
        setupActivityIndicator()
    }
    
    func setupActivityIndicator() {
        spinner.color = spinnerColor
        spinner.startAnimating()
    }

    override func addSubviews() {
        super.addSubviews()
        addSubview(spinner)
    }
    
    override func makeConstraints() {
        spinner.snp.remakeConstraints {
            (make) -> Void in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
        }
        
        super.makeConstraints()
    }
}
