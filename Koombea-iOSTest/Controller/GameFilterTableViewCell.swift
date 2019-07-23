//
//  GameFilterTableViewCell.swift
//  Koombea-iOSTest
//
//  Created by Andres Felipe De La Ossa Navarro on 7/22/19.
//  Copyright © 2019 Andres Felipe De La Ossa Navarro. All rights reserved.
//

import UIKit

class GameFilterTableViewCell: UITableViewCell {

    @IBOutlet weak var gameChecked: UIButton!
    var isOn:Bool = false
    var tapAction: ((UITableViewCell) -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func gameFilterCheckedPressed(_ sender: UIButton) {
        isOn.toggle()
        if isOn{
            gameChecked.setImage(UIImage(named: "circleCheck"), for: .normal)
            FilterPageViewController().gameFilter = self.textLabel!.text!
            FilterPageViewController().gameFIsOn = isOn
        }else{
            gameChecked.setImage(UIImage(named: "circleNoCheck"), for: .normal)
        }
        tapAction?(self)
    }
    
}
