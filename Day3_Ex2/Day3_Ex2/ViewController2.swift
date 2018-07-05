//
//  ViewController2.swift
//  Day3_Ex2
//
//  Created by Trung Kien on 7/5/18.
//  Copyright © 2018 Trung Kien. All rights reserved.
//

import UIKit

protocol CallbackDelegate {
    func callBackDone()
}

class ViewController2: UIViewController {
    
    @objc func send(sender: Notification) {
        let cout = sender.object as! Int

        if cout <= 100{
            lbTime.text = "\(cout)%"
        }
        else{
            lbTime.text = "Done"
            delegate?.callBackDone()
            
        }
    }
    
    
    var delegate : CallbackDelegate?
    @IBOutlet weak var lbTime: UILabel!
    
    
    @IBAction func actionButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let name = Notification.Name(rawValue: "SENDCOUNT")
        NotificationCenter.default.addObserver(self, selector: #selector(send), name: name, object: nil)

        
    }
    
}
