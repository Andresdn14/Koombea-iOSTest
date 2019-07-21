//
//  GameViewController.swift
//  Koombea-iOSTest
//
//  Created by Andres Felipe De La Ossa Navarro on 7/19/19.
//  Copyright © 2019 Andres Felipe De La Ossa Navarro. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class GameViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var gameDataTableView: UITableView!
    
    let GAMES_URL = "https://parseapi.back4app.com/classes/Product"
    let APP_ID = "I9pG8SLhTzFA0ImFkXsEvQfXMYyn0MgDBNg10Aps"
    let APP_KEY = "Yvd2eK2LODfwVmkjQVNzFXwd3N0X7oUuwiMI3VDZ"
    var gamesJSONg = JSON()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameDataTableView.delegate = self
        gameDataTableView.dataSource = self
        let headers : [String : String] = ["X-Parse-Application-Id" : APP_ID, "X-Parse-REST-API-Key":APP_KEY]
        getData(url: GAMES_URL, headers: headers)
    }


    func getData(url: String, headers: [String:String]){
        
        Alamofire.request(url, method: .get, headers: headers).responseJSON{
            response in
            if response.result.isSuccess {
                let gamesJSON: JSON = JSON(response.result.value!)
                self.gamesJSONg = gamesJSON
                print(gamesJSON)
                print(gamesJSON["results"].count)
                for i in 0...gamesJSON["results"].count - 1{
                    
                    if gamesJSON["results"][i]["name"].exists() {
                        print(gamesJSON["results"][i]["name"].stringValue)
                    }else {
                        print("Un objeto malo")
                    }
                }
            }else {
                print("Error al traer los datos")
            }
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 24
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        
        cell.textLabel?.text = gamesJSONg["results"][indexPath.row]["name"].stringValue
        
        
        
        return cell
    }
    
    
}

