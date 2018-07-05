//
//  ViewController.swift
//  Day3
//
//  Created by Trung Kien on 7/4/18.
//  Copyright © 2018 Trung Kien. All rights reserved.
//

import UIKit


class ViewController: UIViewController, DataDelegate {
    func sendText(text: String) {
        lbTextTitle.text = text
    }
    
    
    @IBOutlet weak var lbTextTitle: UILabel!
    @IBAction func actionShow(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "ViewControllerTwo") as! ViewControllerTwo
        controller.datadelegate = self
        
        controller.sendClosure =  { (text : String) -> Void in
            self.lbTextTitle.text = text
        }

        present(controller, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let name = Notification.Name.init("SENDDATA")
        NotificationCenter.default.addObserver(self, selector: #selector(receiver), name: name, object: nil)
       
    }
    
   @objc func receiver(sender : Notification){
        if let text = sender.object as? String{
            lbTextTitle.text = text
        }
    }




}

