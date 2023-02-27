//
//  SecondViewController.swift
//  ProtocolsAndDelegateExample
//
//  Created by Xinyi Zhang on 2/18/23.
//

import UIKit

class SecondViewController: UIViewController {
 
  
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var textStatus: UITextField!
    var welcomeName = ""
    var setStatusDelegate: SetStatusDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblName.text="Welcome \(welcomeName)"
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func setStatusAction(_ sender: Any) {
        guard let status = textStatus.text else{return}
        // call that attempts to call the setStatus method on an object that conforms to the SetStatusDelegate protocol.
        // ? is optional chaining, which means that the method call will only be executed if the 
        setStatusDelegate?.setStatus(status: status)
        // pops the current view controller from the navigation stack, which causes the previous view controller to become the visible view controller.
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
