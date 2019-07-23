//
//  ApplyButtonStyle.swift
//  Koombea-iOSTest
//
//  Created by Andres Felipe De La Ossa Navarro on 7/21/19.
//  Copyright © 2019 Andres Felipe De La Ossa Navarro. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework

class ApplyButtonStyle: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderWidth = 6/UIScreen.main.nativeScale
        layer.borderColor = UIColor(hexString: "DB3069")?.cgColor
        layer.cornerRadius = frame.height/8
        contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height/8
    }
}
