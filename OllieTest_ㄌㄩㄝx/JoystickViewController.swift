//
//  JoystickViewController.swift
//  OllieTest_ㄌㄩㄝx
//
//  Created by CelineChien on 2015/8/18.
//  Copyright © 2015年 CelineChien. All rights reserved.
//

import UIKit

class JoystickViewController: UIViewController,RKUIJoystickViewControllerDelegate {

    
    @IBAction func sleep(sender: UIButton) {
        myOllie.sleep()
        
    }
    
    
    
    
    
    var ollieDeviceManager : OllieDeviceManager!
    var myOllie : RKOllie!
    var joyStickViewController : RKUIJoystickViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ollieDeviceManager.connectToTheOllie()
        self.myOllie = self.ollieDeviceManager.getOllie()
        if self.joyStickViewController != nil {
            print("enable joystick")
            self.joyStickViewController.enableJoystick()
            self.joyStickViewController.joystickDelegate = self
            
        }
        //  Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "joystickSegue"{
            self.joyStickViewController = segue.destinationViewController as! RKUIJoystickViewController
        }
    
    }

    func joystickDidMoveWithHeading(heading: Float, andVelocity velocity: Float) {
        myOllie.driveWithHeading(heading, andVelocity: velocity)
    }

    func joystickDidStop() {
  
        myOllie.stop()

    }




}


