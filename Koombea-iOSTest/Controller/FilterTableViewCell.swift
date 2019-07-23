//
//  FilterTableViewCell.swift
//  Koombea-iOSTest
//
//  Created by Andres Felipe De La Ossa Navarro on 7/22/19.
//  Copyright © 2019 Andres Felipe De La Ossa Navarro. All rights reserved.
//

import UIKit

class FilterCell: UITableViewCell {

    @IBOutlet weak var checkedButton: UIButton!
    var tapAction: ((UITableViewCell) -> Void)?
    var isOn:Bool = false
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }


    @IBAction func filterCheckPressed(_ sender: UIButton) {
        
        isOn.toggle()
        if isOn{
        checkedButton.setImage(UIImage(named: "circleCheck"), for: .normal)
            if self.textLabel?.text == "Downloads"{
                FilterPageViewController().sortFilter = "downloads"
            }
            if self.textLabel?.text == "Date added"{
                FilterPageViewController().sortFilter = "createdAt"
            }
            if self.textLabel?.text == "Price"{
                FilterPageViewController().sortFilter = "price"
            }
        }else{
            checkedButton.setImage(UIImage(named: "circleNoCheck"), for: .normal)
            print(FilterPageViewController().sortFilter)
        }
        tapAction?(self)
    }
}
