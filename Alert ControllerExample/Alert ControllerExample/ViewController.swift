//
//  ViewController.swift
//  Alert ControllerExample
//
//  Created by Xinyi Zhang on 3/2/23.
//

import UIKit

class ViewController: UIViewController {

    
    var txtField:UITextField?
    
    @IBOutlet weak var lblStock: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showAlertController(_ sender: Any) {
        let alertController = UIAlertController(title: "Alert Controller Title", message: "Ctroller message", preferredStyle: .alert)
        
        let OKButton = UIAlertAction(title:"OK", style: .default){
            action in
            print("I'm in OK button")
            // make label equal to value of txtField
            self.lblStock.text = self.txtField?.text
            
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
        
        // displays an alert controller on the screen. The present method is called on the view controller (which is represented by the self keyword), and it takes two arguments: the first argument is the alert controller that you want to display, and the second argument specifies whether the presentation should be animated or not.
        self.present(alertController, animated: true)
    }
    
}

