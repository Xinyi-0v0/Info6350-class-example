//
//  ViewController.swift
//  LocalDBUsingRealm
//
//  Created by Xinyi Zhang on 2/18/23.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    //get an instance of realm db
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(Realm.Configuration.defaultConfiguration.fileURL!)
//        testFunction()
        getValues()
    }
    
    func getValues() {
        do{
            let stocks = try realm.objects(StockPrice.self)
            print(stocks)
        } catch _ as NSError {
            print("unable to add value to the DB")
        }
    }

    func testFunction(){
        let tsla: StockPrice = StockPrice()
        tsla.symbol = "TSLA"
        tsla.price = 234.23
        tsla.volumne = 1545212
        
        let msft: StockPrice = StockPrice()
        msft.symbol = "MSFT"
        msft.price = 201.23
        msft.volumne = 122212
        
        //add to the realm
//        //! ingore all error ---not recommend
//        try! realm.write{
//            realm.add(tsla)
//        }
        
        do {
            try realm.write{
//                realm.add(tsla)
                realm.add(msft)
//                // if want to change value
//                realm.add(tsla, update: .modified)
            }
        } catch _ as NSError{
            print("unable to add value to the DB")
        }
    }

}

