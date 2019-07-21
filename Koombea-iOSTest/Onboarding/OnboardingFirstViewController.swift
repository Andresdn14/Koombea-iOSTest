//
//  OnboardingFirstViewController.swift
//  Koombea-iOSTest
//
//  Created by Andres Felipe De La Ossa Navarro on 7/20/19.
//  Copyright © 2019 Andres Felipe De La Ossa Navarro. All rights reserved.
//

import UIKit
import ChameleonFramework

class OnboardingFirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientView(firstHex: "E55249", secondHex: "2A52BE", view: view) //Setting gradient colors in the view
        


    }
    
    @IBAction func FirstNext(_ sender: Any) {
        self.performSegue(withIdentifier: "firstToSecond", sender: self)
    }
 
    
    

    
}
