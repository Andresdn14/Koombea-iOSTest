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


    }
    

    @IBAction func secondNextB(_ sender: Any) {
        self.performSegue(withIdentifier: "secondToThird", sender: self)
    }
    
}
