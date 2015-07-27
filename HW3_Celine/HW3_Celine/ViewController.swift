//
//  ViewController.swift
//  HW3_Celine
//
//  Created by CelineChien on 2015/7/22.
//  Copyright © 2015年 CelineChien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var number : Int = 0
    @IBOutlet weak var NumberDisplay: UILabel!
    
    @IBAction func NumberOperation(sender: UIButton) {
        
        number++
        
        if( number > 20)
        {
            number=0;
        }
        
        //print("clicked")
        
        NumberDisplay.text = String(number)
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

