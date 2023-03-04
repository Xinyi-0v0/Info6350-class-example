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
import RealmSwift

class ViewController: UIViewController {
    //get an instance of realm db
    let realm = try! Realm()
    
    @IBOutlet weak var tblView: UITableView!
    
    
    var txtField:UITextField?
    var stocksInDB:[StockPrice]=[StockPrice]()
    var stockSymbolForSegue = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        getAllValuesFromDB()
        getStockDataFromAPI()
    }
    
    
    
    // Bar Button item -> change type in system item
    @IBAction func addStockToDB(_ sender: Any) {
        let alertController = UIAlertController(title: "Add Stocks to DB", message: "Type stock Symbol", preferredStyle: .alert)
        
        let OKButton = UIAlertAction(title:"OK", style: .default){
            action in
            print("In OK button")
            guard let symbol = self.txtField?.text else {return}
            if symbol == ""{return}
            self.findAndAddStockToLocalDB(symbol: symbol.uppercased())
            
        }
        
        let cancelButton = UIAlertAction(title:"Cancel", style: .cancel){
            action in print("I'm in Cancel button")
        }
        
        alertController.addTextField{ lblTextField in
            // assign value to txtField
            self.txtField = lblTextField
            lblTextField.placeholder = "Type Stock Value"
        }
        
        alertController.addAction(OKButton)
        alertController.addAction(cancelButton)
        
        
        self.present(alertController, animated: true)
        
    }
    

    
}
