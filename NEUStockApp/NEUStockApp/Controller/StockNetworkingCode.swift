//
//  StockNetworkingCode.swift
//  NEUStockApp
//
//  Created by Xinyi Zhang on 3/2/23.
//

import Foundation
import Alamofire
import SwiftyJSON
import SwiftSpinner
import RealmSwift

extension  ViewController {
    
    func getAndAddStockValueInDB(_ symbol : String){
        let url = "\(baseURL)\(symbol)?apikey=\(apiKey)"
        print("url=\(url)")
        
        SwiftSpinner.show("Getting Stock price for \(symbol)")
        
        AF.request(url).responseData { response in
            SwiftSpinner.hide()
            if response.error != nil {
                print("Error in res")
                return
            }
            
            // At this point I go a valid response
            guard let rawData = response.data else {return}
            guard let jsonArray = JSON(rawData).array else {return}
            guard let stock = jsonArray.first else {return}
            print(stock)
            
            let price = stock["price"].floatValue
            let volume = stock["volumne"].int64Value
            
            let newData = StockPrice()
            newData.symbol = symbol
            newData.price = price
            newData.volumne = volume
            
            self.addDataToReamlmDB(stock: newData)
            self.stocksInDB.append(newData)
            self.tblView.reloadData()
        }
    }
    
    func getStockDataFromAPI(){
        for item in stocksInDB{
            //make network calls for each of stock and update the value
            let url = "\(baseURL)\(item.symbol)?apikey=\(apiKey)"
            
            AF.request(url).responseData { response in
                if response.error != nil {
                    print("Error in res")
                    return
                }
                
                // At this point I go a valid response
                guard let rawData = response.data else {return}
                guard let jsonArray = JSON(rawData).array else {return}
                guard let stock = jsonArray.first else {return}
                print(stock)
                
                let symbol = stock["symbol"].stringValue
                let price = stock["price"].floatValue
                let volume = stock["volumne"].int64Value
                
                let newData = StockPrice()
                newData.symbol = symbol
                newData.price = price
                newData.volumne = volume
                
                if let i = self.stocksInDB.firstIndex(where: {$0.symbol == symbol}){
                    self.stocksInDB[i].price=price
                    self.stocksInDB[i].volumne=volume
                    self.tblView.reloadData()
                }
                
            }
        }
        
    }
}
