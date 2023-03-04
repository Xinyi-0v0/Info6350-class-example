//
//  StockRealmFunctions.swift
//  NEUStockApp
//
//  Created by Xinyi Zhang on 3/2/23.
//

import Foundation
import RealmSwift


extension  ViewController {
    
    func getAllValuesFromDB() {
  
        let stocks = realm.objects(StockPrice.self)
        
        stocksInDB.removeAll()
        
        for stock in stocks {
            let stockPrice = StockPrice()
            stockPrice.symbol = stock.symbol
            stockPrice.price = stock.price
            stockPrice.volumne = stock.volumne
            stocksInDB.append(stockPrice)
        }
        tblView.reloadData()
  
    }
    
    func findAndAddStockToLocalDB(symbol:String){
        //if in db, don't be anything
        if doesStockExistInDB(symbol) {
            print("Stock exists!")
            return
        }
        // make a network call for the stock symbol
        // if exist, add to db
        getAndAddStockValueInDB(symbol)
        //otherwise, don;'t do anything
        
    }
    
    func doesStockExistInDB(_ symbol : String) -> Bool{
        let data = realm.object(ofType: StockPrice.self, forPrimaryKey: symbol)
        if data != nil {
            return true
        } else {
            return false
        }
    }
    
    func addDataToReamlmDB(stock : StockPrice) {
        do {
            try realm.write{
                realm.add(stock, update: .modified )
            }
        } catch let err as NSError{
            print("unable to add value to the DB \(err)")
        }
    }
    
    func removeStockFromDB(symbol : String) {
    
        guard let stock = realm.objects(StockPrice.self).filter("symbol = %@", symbol).first else {return}
        try! realm.write{
            realm.delete(stock)
        }
   
    }
    
}
