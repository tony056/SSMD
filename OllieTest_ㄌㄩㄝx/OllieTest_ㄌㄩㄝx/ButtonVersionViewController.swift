//
//  ButtonVersionViewController.swift
//  OllieTest_ㄌㄩㄝx
//
//  Created by CelineChien on 2015/8/17.
//  Copyright © 2015年 CelineChien. All rights reserved.
//

import UIKit

class ButtonVersionViewController: UIViewController {
    var ollieDeviceManager : OllieDeviceManager!
    var myOllie : RKOllie!
    var heading : Float = 0.0
    
    
    @IBAction func Back(sender: UIButton) {
        heading += 180
        self.myOllie.driveWithHeading(heading, andVelocity: 0.7)
    }
    
    @IBAction func stop(sender: UIButton) {
    
            self.myOllie.driveWithHeading(heading, andVelocity: 0)
    }
    
    
    @IBAction func sleep(sender: UIButton) {
      myOllie.sleep()
        
    }
    
    
    @IBAction func turnRightNinty(sender: UIButton) {
        if self.myOllie != nil {
            if heading >= 360 {
                heading = 0.5
                
            }
            heading += 90
                self.myOllie.driveWithHeading(heading, andVelocity: 0.0)
        
        }
    
    }
    @IBAction func Left90(sender: UIButton) {
        if self.myOllie != nil {
            if heading <= -360 {
                heading = 0.5
            }
            heading -= 90
            self.myOllie.driveWithHeading(heading, andVelocity: 0.0)
        
        }
    }
    
    
    @IBAction func Forward(sender: UIButton) {
        
        self.myOllie.driveWithHeading(heading, andVelocity: 0.7)
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
//        print(self.ollieDeviceManager.getDeviceListLength())
        self.ollieDeviceManager.connectToTheOllie()
        self.myOllie = self.ollieDeviceManager.getOllie()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
