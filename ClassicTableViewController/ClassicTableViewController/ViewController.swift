//
//  ViewController.swift
//  ClassicTableViewController
//
//  Created by Xinyi Zhang on 2/13/23.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    
    let friends = ["Ashish","Tom","Bill","Peter","Sara","Mark"]

    @IBOutlet weak var tblView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Add Tableview.delegate and tableView.dataSource = self in viewDidLoad
        tblView.delegate = self
        tblView.dataSource = self
    }

    // Add Stub functions numberOfRowsInSection and cellForRowAt
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    
    //indexPath是UITableViewDataSource协议中的一个参数，表示正在设置其单元格内容的行的索引路径。其中包含了两个整数值，一个是表示section的索引，一个是表示row的索引。
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //?符号是Swift中的可选链操作符，用于安全地访问可选值的属性或方法，以避免由于可选值为nil而引发的运行时错误,表示只有当textLabel存在时,才会访问该属性并将其设置为friends数组中的值。
        cell.textLabel?.text=friends[indexPath.row]
        return cell
    }

}

