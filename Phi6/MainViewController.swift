//
//  MainViewController.swift
//  Phi6
//
//  Created by Armando Ariemma on 25/01/2017.
//  Copyright © 2017 ITNH. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //getRandomColor()
       // timerF()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func timerF(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MainViewController.getRandomColor), userInfo: nil, repeats: true)
    }

    
    func getRandomColor() {
        let red   = Float((arc4random() % 256)) / 255.0
        let green = Float((arc4random() % 256)) / 255.0
        let blue  = Float((arc4random() % 256)) / 255.0
        let alpha = Float(1.0)
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options:[.repeat, .autoreverse], animations: {
            self.view.backgroundColor = UIColor(colorLiteralRed: red, green: green, blue: blue, alpha: alpha)
        }, completion:nil)
    }
    // Do any additional setup after loading the view.

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
