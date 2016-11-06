//
//  RoofUIPreviewRowFormNavigator.swift
//  Roof
//
//  Created by João Victor de Souza Ritter on 7/25/16.
//  Copyright © 2016 Roof. All rights reserved.
//

import Foundation
import Former

protocol RoofUIPreviewRowFormerNavigator: class {
    func showOverlayForPreivewRowFormer(previewRowFormer: RoofUIPreviewRowFormer<RoofUIFormPreviewTableViewCell>)
}
