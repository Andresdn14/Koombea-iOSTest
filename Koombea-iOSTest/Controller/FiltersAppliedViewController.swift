//
//  FiltersAppliedViewController.swift
//  Koombea-iOSTest
//
//  Created by Andres Felipe De La Ossa Navarro on 7/23/19.
//  Copyright © 2019 Andres Felipe De La Ossa Navarro. All rights reserved.
//

import UIKit

class FiltersAppliedViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var filtersAplliedTableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       filtersAplliedTableview.reloadData()
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FilterPageViewController().filtered.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = UITableViewCell()
        
        cell.textLabel?.text = FilterPageViewController().filtered[indexPath.row].name
        
        
        return cell
    }



}
