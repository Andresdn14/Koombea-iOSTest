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
import RealmSwift
import PullToRefresh

class GameViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var gameDataTableView: UITableView!
    let getModel = GetModel()
    let realm = try! Realm()
    let refresher = PullToRefresh()

    var games: Results<Game>?{
        didSet{
            self.gameDataTableView.reloadData()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameDataTableView.delegate = self
        gameDataTableView.dataSource = self
        loadGames()
        refresh()

    }
    deinit {
        gameDataTableView.removePullToRefresh(at: .top)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    func refresh(){
        gameDataTableView.addPullToRefresh(refresher) {
            self.getModel.getData()
            self.loadGames()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                 self.gameDataTableView.reloadData()
            })
           
            self.gameDataTableView.endRefreshing(at:.top)
        }
    }
    


    
    func loadGames(){
        games = realm.objects(Game.self)
        gameDataTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        if let gamesUW = games {
        count = gamesUW.count
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if let game = games?[indexPath.row] {
        cell.textLabel?.text = game.name + " " + game.rating
        
        }
        
        return cell
    }
    
    
}

