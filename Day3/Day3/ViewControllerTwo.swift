//
//  ViewControllerTwo.swift
//  Day3
//
//  Created by Trung Kien on 7/4/18.
//  Copyright © 2018 Trung Kien. All rights reserved.
//

import UIKit

protocol DataDelegate {
    func sendText(text: String)
}


class ViewControllerTwo: UIViewController , UITextFieldDelegate{

    var datadelegate : DataDelegate?
    var sendClosure: ((_ text : String) -> Void)?
    
    @IBOutlet weak var tfEdit: UITextField!
    @IBAction func actionClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func actionSendDelegate(_ sender: Any) {
        if let text = tfEdit.text{
            datadelegate?.sendText(text: text)
        }
    }
    @IBAction func actionSendClosure(_ sender: Any) {
        if let text = tfEdit.text{
            self.sendClosure!(text)
            
        }

    }
    
    @IBAction func actionSendNotifi(_ sender: Any) {
        if let text = tfEdit.text{
            let name = Notification.Name.init("SENDDATA")
            NotificationCenter.default.post(name: name, object: text)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Begin editing")
        
    }



}
