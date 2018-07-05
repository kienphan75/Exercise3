//
//  ViewController.swift
//  Day3_Ex2
//
//  Created by Trung Kien on 7/5/18.
//  Copyright © 2018 Trung Kien. All rights reserved.
//

import UIKit

class ViewController: UIViewController , CallbackDelegate{
    func callBackDone() {
        timer.invalidate()
        lbTimeCount.text = "Done"
    }
    

    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var lbTimeCount: UILabel!
    var timer = Timer()
    var count = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbTimeCount.text = "0%"
        progress.setProgress(0, animated: true)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }

    @objc func updateTime(){
        let r = random()
        print(r)
        count = count + r
        if count <= 100{
            lbTimeCount.text = "\(count)%"
            progress.setProgress(Float(count) / 100.0 , animated: true)
            let name = Notification.Name(rawValue: "SENDCOUNT")
            NotificationCenter.default.post(name: name, object: count)
        }
        else{
            timer.invalidate()
            lbTimeCount.text = "Done"
        }
    }
    
    func random() -> Int{
        let r : Int32 = Int32(arc4random_uniform(2))
        return Int(r)
    }

    @IBAction func actionButton(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        present(controller, animated: true, completion: nil)
        
    }
    
}

