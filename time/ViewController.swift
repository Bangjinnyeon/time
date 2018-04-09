//
//  ViewController.swift
//  time
//
//  Created by D7703_15 on 2018. 4. 9..
//  Copyright © 2018년 D7703_15. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var stop: UIButton!
    var count = 0
    var myTimer = Timer()
    var minh = 0
    var sech = 0
    var sec = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stop.isEnabled = false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    func updateTime(){
        count = count + 1
        minh = count / 60 / 100
        sech = (count - (minh * 60 * 100)) / 100
        sec = count - (minh * 60 * 100) - (sech * 100)
        timeLabel.text = String(format: "%02d:%02d:%02d", minh, sech, sec)
    }
    @IBAction func Start(_ sender: Any) {
        myTimer = Timer.scheduledTimer(withTimeInterval: 1/100, repeats: true, block: {(myTimer) in self.updateTime()})
        start.isEnabled = false
        stop.isEnabled = true
    }
    
    @IBAction func Stop(_ sender: Any) {
        myTimer.invalidate()
        start.isEnabled = true
        stop.isEnabled = false
    }
    @IBAction func Reset(_ sender: Any) {
        myTimer.invalidate()
        count = 0;
        minh = 0;
        sech = 0;
        sec = 0;
        timeLabel.text = "00:00:00"
    }
}
