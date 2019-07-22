//
//  GetModel.swift
//  Koombea-iOSTest
//
//  Created by Andres Felipe De La Ossa Navarro on 7/21/19.
//  Copyright © 2019 Andres Felipe De La Ossa Navarro. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import RealmSwift
import SwiftDate

class GetModel: NSObject {

    let realm = try! Realm()
    
    
    func getData(){
        
        let GAMES_URL = "https://parseapi.back4app.com/classes/Product"
        let APP_ID = "I9pG8SLhTzFA0ImFkXsEvQfXMYyn0MgDBNg10Aps"
        let APP_KEY = "Yvd2eK2LODfwVmkjQVNzFXwd3N0X7oUuwiMI3VDZ"
        let headers : [String : String] = ["X-Parse-Application-Id" : APP_ID, "X-Parse-REST-API-Key":APP_KEY]

        Alamofire.request(GAMES_URL, method: .get, headers: headers).responseJSON{
            response in
            if response.result.isSuccess {
                self.deleteAll()
                if let resValue = response.result.value {
                    let gamesJSON: JSON = JSON(resValue)
                    self.JSONProcessing(json: gamesJSON)
                print(gamesJSON)
                }
            }else {
                
                print("Error getting data")
            }
        }
    }
    
    func deleteAll(){
        do{
            try realm.write {
                realm.deleteAll()
            }
        }catch{
            print("Error at deleting")
        }
    }
    
    func saveGame(game:Game){
        do {
            try realm.write {
                realm.add(game)
            }
        }catch{
            print("error trying to save")
        }
    }
    
    
    func JSONProcessing(json:JSON){
        
                for i in 0...json["results"].count - 1{
                    
                    if json["results"][i]["name"].exists() && json["results"][i]["objectId"].exists() && json["results"][i]["universe"].exists() && json["results"][i]["price"].exists() && json["results"][i]["imageURL"].exists() && json["results"][i]["description"].exists() && json["results"][i]["kind"].exists() && json["results"][i]["popular"].exists() && json["results"][i]["rating"].exists() && json["results"][i]["downloads"].exists() && json["results"][i]["SKU"].exists() && json["results"][i]["createdAt"].exists() && json["results"][i]["updatedAt"].exists() {
                        
                        let objectId:String = json["results"][i]["objectId"].stringValue
                        let name:String = json["results"][i]["name"].stringValue
                        let universe:String = json["results"][i]["universe"].stringValue
                        let price:String = json["results"][i]["price"].stringValue
                        let imageurl:String = json["results"][i]["imageURL"].stringValue
                        let kind:String = json["results"][i]["kind"].stringValue
                        let popular:Bool = json["results"][i]["popular"].boolValue
                        let rating:String = json["results"][i]["rating"].stringValue
                        let downloads:String = json["results"][i]["downloads"].stringValue
                        let descripti:String = json["results"][i]["description"].stringValue
                        let SKU:String = json["results"][i]["SKU"].stringValue
                        guard let createdAt = json["results"][i]["createdAt"].stringValue.toDate()?.date else{fatalError()}
                        guard let updatedAt = json["results"][i]["updatedAt"].stringValue.toDate()?.date else{fatalError()}
                            
                        

                        
                        let game = Game()
                        game.objectId = objectId
                        game.name = name
                        game.universe = universe
                        game.price = price
                        game.imageURL = imageurl
                        game.kind = kind
                        game.popular = popular
                        game.rating = rating
                        game.downloads = downloads
                        game.descripti = descripti
                        game.SKU = SKU
                        game.createdAt = createdAt
                        game.updatedAt = updatedAt
                    
                        saveGame(game: game)

            }
        }
    }
    
    
}
