//
//  ViewController.swift
//  HW3_P.E.KAO
//
//  Created by Thomas on 2015/7/22.
//  Copyright © 2015年 Thomas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var number : Int = 0
    var a : Int = 21
    @IBOutlet weak var numberDisplay: UILabel!
    


    @IBAction func numberOperation(sender: UIButton) {
            //print("clicked")
            number++
            numberDisplay.text = String(number)
        if  number > 19 { number -= a }
        
        
    }
    
        override func viewDidLoad(){
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

        override func didReceiveMemoryWarning(){
    super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    }