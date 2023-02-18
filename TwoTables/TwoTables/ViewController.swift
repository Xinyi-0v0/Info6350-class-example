//
//  ViewController.swift
//  TwoTables
//
//  Created by Xinyi Zhang on 2/13/23.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    let restaurants = ["a","b","c","d"]
    var foods =  [String]();
    
    
    @IBOutlet weak var tblViewTop: UITableView!
    @IBOutlet weak var tblViewBottom: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tblViewTop {
            return restaurants.count
        } else {
            return foods.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == tblViewTop {
            let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath)
            cell.textLabel?.text = restaurants[indexPath.row]
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath)
            cell.textLabel?.text = foods[indexPath.row]
            return cell
        }


    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tblViewTop { // 处理上面的表格视图
            let selectedRestaurant = restaurants[indexPath.row]
            print(selectedRestaurant)
            switch selectedRestaurant {
            case "a":
                foods = ["a"]
            case "b":
                foods = ["b"]
            case "c":
                foods = ["c"]
            default:
                foods = ["d"]
                
            }
            //reloadData()是UITableView类提供的方法，用于重新加载表格视图的数据。
            tblViewBottom.reloadData()
           }
        
    }



}

