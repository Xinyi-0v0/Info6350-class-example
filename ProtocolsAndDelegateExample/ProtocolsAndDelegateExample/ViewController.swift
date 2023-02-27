//
//  ViewController.swift
//  ProtocolsAndDelegateExample
//
//  Created by Xinyi Zhang on 2/18/23.
//

import UIKit

//SetStatusDelegate: means this class will be a delegate object,should conform to protocol 'SetStatusDelegate'
class ViewController: UIViewController, SetStatusDelegate {

/*
 1. Create a swift file which has a protocol which would have to be implemented when someone conforms to it
 2. In the second VC, we will add an optional variable for the protocol
 3.  In the second VC, whenever an aciton is taken we will call the protocol function
 4. In the first VC conform to the protocol and implement the function
 5. In the first VC, listen to the second VC by setting By itself as the delegate of secondVC.
 */

    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var lblStatus: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    // add action for button to activate second VC
    @IBAction func goToSecondVC(_ sender: Any) {
        performSegue(withIdentifier: "segueSecondVC", sender: self)
    }
    
    
    // get date for second VC
    override func prepare(for segue:UIStoryboardSegue, sender:Any? ){
        if segue.identifier == "segueSecondVC" {
            // use the as! operator to force downcast the destination view controller to SecondViewController type. So this class can access all the properties and methods of the SecondViewController class using the secondVC variable.
            let secondVC = segue.destination as! SecondViewController
            guard let name = textName.text else {return }
            secondVC.welcomeName = name
            //  the current instance of the view controller is assigning itself as the delegate for secondVC. By setting itself as the delegate, the current view controller can receive updates or messages from the other view controller or object, and respond appropriately.
            secondVC.setStatusDelegate = self
        }
    }
    
    
    func setStatus(status: String) {
        lblStatus.text = "My Status is : \(status)"    }
    
    
}

