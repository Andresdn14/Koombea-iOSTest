//
//  OnboardingFirstViewController.swift
//  Koombea-iOSTest
//
//  Created by Andres Felipe De La Ossa Navarro on 7/20/19.
//  Copyright © 2019 Andres Felipe De La Ossa Navarro. All rights reserved.
//

import UIKit

class OnboardingFirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func FirstNext(_ sender: Any) {
        print("se hundio")
        self.performSegue(withIdentifier: "firstToSecond", sender: self)
    }
    
}
