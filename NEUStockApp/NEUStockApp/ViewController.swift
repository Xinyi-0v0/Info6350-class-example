//
//  ViewController.swift
//  NEUStockApp
//
//  Created by Xinyi Zhang on 2/11/23.
//


import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class ViewController: UIViewController {

 
    @IBOutlet weak var textStockSymbol: UITextField!
    
    
    @IBOutlet weak var lblStockPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func getStockPrice(_ sender: Any) {
//        SwiftSpinner.hide()
        print("I'm here")
        guard let symbol = textStockSymbol.text else {return}
        let url = "\(baseURL)\(symbol)?apikey=\(apiKey)"
        print("url=\(url)")
        // other way
//        if let symbol = textStockSymbol.text {
//            let url = "\(baseURL)"
//        }
//
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
            
//            let symbol = stock["symbol"].stringValue
            let price = stock["price"].doubleValue
//            let volume = stock["volumne"].intValue

            // self: go to this view controller
            self.lblStockPrice.text = "Price: \(price)$"

        }
        
    }
}

