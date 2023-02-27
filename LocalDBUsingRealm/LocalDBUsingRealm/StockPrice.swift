//
//  StockPrice.swift
//  LocalDBUsingRealm
//
//  Created by Xinyi Zhang on 2/18/23.
//

import Foundation
import RealmSwift

class StockPrice: Object {
    // object is object c
    // dynammic: means it's dynamic var. when change in db change it in app. It will change the websocket
    @objc dynamic var symbol: String = ""
    @objc dynamic var price: Float = 0.0
    @objc dynamic var volumne: Int64 = 0
    
    //make symbol as primary key
    override static func primaryKey() -> String? {
        return "symbol"
    }
    
    
}
