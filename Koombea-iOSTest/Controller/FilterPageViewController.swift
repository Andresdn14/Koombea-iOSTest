//
//  FilterPageViewController.swift
//  Koombea-iOSTest
//
//  Created by Andres Felipe De La Ossa Navarro on 7/21/19.
//  Copyright © 2019 Andres Felipe De La Ossa Navarro. All rights reserved.
//
import Foundation
import UIKit
import RealmSwift
import RangeSeekSlider

class FilterPageViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,RangeSeekSliderDelegate{
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sliderView: RangeSeekSlider!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var gamesFilTableView: UITableView!
    @IBOutlet weak var filterTableView: UITableView!
    let filterCell = FilterCell()
    var gameFIsOn:Bool = false
    let gameFilterCell = GameFilterTableViewCell()
    var gameFilter:String = ""
    var minPrice:Double = 0
    var maxPrice:Double = 100
    let realm = try! Realm()
    let getModel = GetModel()
    var sortFilter:String = ""
    var zeroStar:Bool = false
    var oneStar:Bool = false
    var twoStar:Bool = false
    var threeStar:Bool = false
    var fourStar:Bool = false
    var fiveStar:Bool = false
    var gamesFil: [GamesFilter] = []
    var games: Results<Game>?
    var filterResults: Results<Game>?
    var filtered:[Game] = []
    
    var filterArray = ["Downloads","Date added","Price"]
    
    override func viewWillAppear(_ animated: Bool) {
        loadUI()
        configSlider()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegateAndDatasource()
        gamesFilTableView.reloadData()
        
    }
    

    func setDelegateAndDatasource(){
        gamesFilTableView.delegate = self
        gamesFilTableView.dataSource = self
        filterTableView.delegate = self
        filterTableView.dataSource = self


    }
    func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat) {
        minPrice = Double(round(slider.selectedMinValue * 100)/100)
        maxPrice = Double(round(slider.selectedMinValue * 100)/100)
        minLabel.text = "$\(Double(round(slider.selectedMinValue * 100)/100))"
        maxLabel.text = "$\(Double(round(slider.selectedMaxValue * 100)/100))"
    }

    func configSlider(){
        let slider = sliderView!
        slider.delegate = self
        slider.initialColor = .lightGray
        let maxPriceGame = realm.objects(Game.self).sorted(byKeyPath: "price",ascending: false)
        slider.maxValue = CGFloat(maxPriceGame[1].price)
        slider.selectedMinValue = 20
        minLabel.text = "$20"
        slider.maxLabelAccessibilityLabel =  "$" + String(maxPriceGame[1].price)
        let minPriceGame = realm.objects(Game.self).sorted(byKeyPath: "price",ascending: true)
        slider.minValue = CGFloat(minPriceGame[1].price)
        slider.selectedMaxValue = 60
        maxLabel.text = "$60"
        slider.minLabelAccessibilityLabel =  "$" + String(minPriceGame[1].price)
        print(slider.maxLabelAccessibilityLabel ?? "No hay")
        print(slider.minLabelAccessibilityLabel ?? "No hay")
        
    }
    
    
    
    func resultToarray(result:Results<Game>?) -> [Game]{
        var resArray:[Game] = []
        for i in result!{
            resArray.append(i)
        }
        return resArray
    }
    
    
    
    func filter(){
        let emptyResult:Results<Game>? = realm.objects(Game.self).filter("rating == '7'")
        filterResults = realm.objects(Game.self)
        
        print(gameFilterCell.isOn)
        if gameFilterCell.isOn {
            filterResults = filterResults?.filter("universe CONTAINS[cd] %@",gameFilter)
            print("filter results are \(filterResults)")
        }

        filterResults = filterResults?.filter("price BETWEEN {\(minPrice),\(maxPrice)}")
        
        if oneStar || twoStar || threeStar || fourStar || fiveStar {zeroStar = false} else{zeroStar = true}
        let zeroFilter:Results<Game>? = zeroStar ? filterResults: emptyResult
        let oneFilter:Results<Game>? = zeroStar ? filterResults?.filter("rating = %a","1") : emptyResult
        let twoFilter:Results<Game>? = zeroStar ? filterResults?.filter("rating = %a","2") : emptyResult
        let threeFilter:Results<Game>? = zeroStar ? filterResults?.filter("rating = %a","3") : emptyResult
        let fourFilter:Results<Game>? = zeroStar ? filterResults?.filter("rating = %a","4") : emptyResult
        let fiveFilter:Results<Game>? = zeroStar ? filterResults?.filter("rating = %a","5") : emptyResult

        let zeroArray = resultToarray(result: zeroFilter)
        let oneArray = resultToarray(result: oneFilter)
        let twoArray = resultToarray(result: twoFilter)
        let threeArray = resultToarray(result: threeFilter)
        let fourArray = resultToarray(result: fourFilter)
        let fiveArray = resultToarray(result: fiveFilter)
        print(zeroFilter)
        print(oneFilter)
        print(twoFilter)
        print(threeArray)
        print(fourArray)
        print(fiveArray)
        var starFilteredArray = zeroArray + oneArray + twoArray + threeArray + fourArray + fiveArray
        
        print(starFilteredArray)
        if filterCell.isOn && sortFilter == "downloads" {
            starFilteredArray.sort(by: { $0.downloads > $1.downloads })
        }
        if filterCell.isOn && sortFilter == "createdAt" {
            starFilteredArray.sort(by: { $0.createdAt > $1.createdAt })
        }
        if filterCell.isOn && sortFilter == "price" {
            starFilteredArray.sort(by: { $0.price > $1.price })
        }
        filtered = starFilteredArray
        print(starFilteredArray)
        
        performSegue(withIdentifier: "goToFiltered", sender: self)
        
    }
    
    func loadUI(){
        games = realm.objects(Game.self)
        gamesFil = []
        let gamesDistinct = realm.objects(Game.self).distinct(by: ["universe"])
        
        for fil in gamesDistinct {
            let gameFil = GamesFilter()
            gameFil.universe = fil.universe
            gameFil.selected = false
            gamesFil.append(gameFil)
            
        }
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRows = Int()
        
        switch tableView {
        case gamesFilTableView:
            numberOfRows = gamesFil.count
        case filterTableView:
            numberOfRows = filterArray.count
        default:
            print("Error while datasource method")
        }

        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch tableView {
        case gamesFilTableView:
            cell = tableView.dequeueReusableCell(withIdentifier: "gamesFilCell", for: indexPath)
            cell.textLabel?.text = gamesFil[indexPath.row].universe
        case filterTableView:
            cell = tableView.dequeueReusableCell(withIdentifier: "filterCell", for: indexPath)
            cell.textLabel?.text = filterArray[indexPath.row]
            
        default:
            print("Error while datasource method")
        }
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var cell = UITableViewCell()
        switch tableView {
        case gamesFilTableView:
        cell = tableView.dequeueReusableCell(withIdentifier: "gamesFilCell", for: indexPath)
        cell.textLabel?.text = gamesFil[indexPath.row].universe
        case filterTableView:
        cell = tableView.dequeueReusableCell(withIdentifier: "filterCell", for: indexPath)
        cell.textLabel?.text = filterArray[indexPath.row]
        default:
        print("Error while datasource method")
        }
    }
    
    
    @IBAction func applyButtonPressed(_ sender: Any) {
        filter()
    }
    
    @IBAction func ratingCheckboxPressed(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            print(sender.tag)
            oneStar.toggle()
            
            if oneStar {
                oneButton.setImage(UIImage(named: "checked.png"), for: .normal)
            }else{
                oneButton.setImage(UIImage(named: "notChecked.png"), for: .normal)
            }
            
        case 2:
            print(sender.tag)
            twoStar.toggle()
            if twoStar {
                
                twoButton.setImage(UIImage(named: "checked.png"), for: .normal)
            }else{
                twoButton.setImage(UIImage(named: "notChecked.png"), for: .normal)
            }
        case 3:
            print(sender.tag)
            threeStar.toggle()
            if threeStar {
                threeButton.setImage(UIImage(named: "checked.png"), for: .normal)
            }else{
                threeButton.setImage(UIImage(named: "notChecked.png"), for: .normal)
            }
        case 4:
            print(sender.tag)
            fourStar.toggle()
            if fourStar {
                fourButton.setImage(UIImage(named: "checked.png"), for: .normal)
            }else{
                fourButton.setImage(UIImage(named: "notChecked.png"), for: .normal)
            }
        case 5:
            print(sender.tag)
            fiveStar.toggle()
            if fiveStar {
                fiveButton.setImage(UIImage(named: "checked.png"), for: .normal)
            }else{
                fiveButton.setImage(UIImage(named: "notChecked.png"), for: .normal)
            }
        default:
            print("Error while toogle")
        }
    }
    
    
    
}
