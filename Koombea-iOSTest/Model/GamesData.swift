//
//  GamesData.swift
//  Koombea-iOSTest
//
//  Created by Andres Felipe De La Ossa Navarro on 7/21/19.
//  Copyright © 2019 Andres Felipe De La Ossa Navarro. All rights reserved.
//

import Foundation
import RealmSwift

class Game:Object {
    @objc dynamic var objectId: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var universe: String = ""
    @objc dynamic var price: String = ""
    @objc dynamic var imageURL: String = ""
    @objc dynamic var kind: String = ""
    @objc dynamic var popular: Bool = false
    @objc dynamic var rating: String = ""
    @objc dynamic var downloads: String = ""
    @objc dynamic var descripti: String = ""
    @objc dynamic var SKU: String = ""
    @objc dynamic var createdAt = Date()
    @objc dynamic var updatedAt = Date()
    
}
