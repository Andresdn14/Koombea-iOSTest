//
//  GamesFilter.swift
//  Koombea-iOSTest
//
//  Created by Andres Felipe De La Ossa Navarro on 7/22/19.
//  Copyright © 2019 Andres Felipe De La Ossa Navarro. All rights reserved.
//

import Foundation
import RealmSwift

class GamesFilter: Object {
    @objc dynamic var universe: String = ""
    @objc dynamic var selected: Bool = false
}
