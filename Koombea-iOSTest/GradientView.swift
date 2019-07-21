//
//  GradientView.swift
//  Koombea-iOSTest
//
//  Created by Andres Felipe De La Ossa Navarro on 7/20/19.
//  Copyright © 2019 Andres Felipe De La Ossa Navarro. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework

extension UIViewController {
    
    func setGradientView(firstHex:String,secondHex:String,view:UIView){
        let newLayer = CAGradientLayer()
        
        let firstColor = UIColor(hexString: firstHex)
        let secondColor = UIColor(hexString: secondHex)
        newLayer.colors = [firstColor!.cgColor,secondColor!.cgColor]
        newLayer.frame = view.frame
        view.layer.addSublayer(newLayer)
        view.layer.insertSublayer(newLayer, at: 0)
        

    }
    
    
}
