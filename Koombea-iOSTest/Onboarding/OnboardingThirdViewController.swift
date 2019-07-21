//
//  OnboardingThirdViewController.swift
//  Koombea-iOSTest
//
//  Created by Andres Felipe De La Ossa Navarro on 7/20/19.
//  Copyright © 2019 Andres Felipe De La Ossa Navarro. All rights reserved.
//

import UIKit

class OnboardingThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientView(firstHex: "E55249", secondHex: "2A52BE", view: view) //Setting gradient colors in the view

    }
    
//    @IBAction func getStartedButton(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainVC = storyboard.instantiateViewController(withIdentifier: "mainVC") as! ViewController
//        self.present(mainVC, animated: true, completion: nil)
//    }
    
    @IBAction func getStarted(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storyboard.instantiateViewController(withIdentifier: "mainVC") as! GameViewController
        self.present(mainVC, animated: true, completion: nil)
    }
    
}
