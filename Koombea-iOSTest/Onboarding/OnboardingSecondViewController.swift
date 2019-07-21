//
//  OnboardingSecondViewController.swift
//  Koombea-iOSTest
//
//  Created by Andres Felipe De La Ossa Navarro on 7/20/19.
//  Copyright © 2019 Andres Felipe De La Ossa Navarro. All rights reserved.
//

import UIKit

class OnboardingSecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       setGradientView(firstHex: "E55249", secondHex: "2A52BE", view: view) //Setting gradient colors in the view

    }
    

//    @IBAction func secondNextB(_ sender: Any) {
//        self.performSegue(withIdentifier: "secondToThird", sender: self)
//    }
    @IBAction func secNext(_ sender: Any) {
        self.performSegue(withIdentifier: "secondToThird", sender: self)
    }
    
}
