//
//  ButtonVersionVeiwControler.swift
//  OLLIE_Thomas
//
//  Created by Thomas on 2015/8/17.
//  Copyright © 2015年 Thomas. All rights reserved.
//

import UIKit

class ButtonVersionVeiwControler: UIViewController {
    var ollieDeviceManager : OllieDeviceManager!
    var myollie : RKOllie!
    var heading : Float = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ollieDeviceManager.connectToTheOllie()
        self.myollie = self.ollieDeviceManager.getOllie()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func turnright90(sender: UIButton) {
        if self.myollie != nil {
            if heading >= 360 {
                heading = 0
            }
            heading += 90
            self.myollie.driveWithHeading(heading, andVelocity: 0.0)
            
        }
    }

    @IBAction func turnleft90(sender: UIButton) {
        if self.myollie != nil {
            if heading >= 360 {
                heading = 0
            }
            heading -= 90
            self.myollie.driveWithHeading(heading, andVelocity: 0.0)
            
        }

    }
    
    @IBAction func gostright(sender: UIButton) {
            self.myollie.driveWithHeading(heading, andVelocity: 1.0)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
