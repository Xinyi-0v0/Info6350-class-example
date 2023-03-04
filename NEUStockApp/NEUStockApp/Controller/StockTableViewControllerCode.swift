//
//  StockTableViewControllerCode.swift
//  NEUStockApp
//
//  Created by Xinyi Zhang on 3/2/23.
//

import Foundation
import UIKit

extension  ViewController: UITableViewDelegate, UITableViewDataSource {
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocksInDB.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let symbol = stocksInDB[indexPath.row].symbol
        let price = stocksInDB[indexPath.row].price
        cell.textLabel?.text="\(symbol):\(price)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete {
            let stock = stocksInDB[indexPath.row]
            stocksInDB.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            removeStockFromDB(symbol: stock.symbol)
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // click this row, perform segue
        let stock = stocksInDB[indexPath.row]
        stockSymbolForSegue = stock.symbol
        performSegue(withIdentifier: "segueStockDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueStockDetails" {
            let vc = segue.destination as! StockDetailsViewController
            vc.stockSymbol = stockSymbolForSegue
        }
    }
}
