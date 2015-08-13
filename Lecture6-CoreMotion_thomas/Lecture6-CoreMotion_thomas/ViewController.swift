//
//  ViewController.swift
//  Lecture6-CoreMotion_thomas
//
//  Created by Thomas on 2015/8/6.
//  Copyright © 2015年 Thomas. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    
    var motionManager = CMMotionManager()
    @IBOutlet weak var accelX: UILabel!
    
    @IBOutlet weak var accelY: UILabel!
    
    @IBOutlet weak var accelZ: UILabel!
    
    @IBOutlet weak var gyroX: UILabel!
    
    @IBOutlet weak var gyroY: UILabel!
    
    @IBOutlet weak var gyroZ: UILabel!
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view, typically from a nib.
        motionManager.accelerometerUpdateInterval = 0.2
        motionManager.gyroUpdateInterval = 0.2
        motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler:{
            (accelData:CMAccelerometerData?,error:NSError?) -> Void in
            self.outputAccelData(accelData!.acceleration)
            if error != nil{
                print("\(error)")
            }
            
        })
        
        motionManager.startGyroUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler: {
            (gyroData: CMGyroData?, error: NSError?) -> Void in
            self.outputRotationData(gyroData!.rotationRate)
            if error != nil{
                print("\(error)")
            
            }
        })
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func outputAccelData(accel:CMAcceleration){
        accelX.text = String(format: "%.2f", accel.x)
        accelY.text = String(format: "%.2f", accel.y)
        accelZ.text = String(format: "%.2f", accel.z)
    }
    func outputRotationData(rotation:CMRotationRate){
        gyroX.text = String(format: "%.2f", rotation.x)
        gyroY.text = String(format: "%.2f", rotation.y)
        gyroZ.text = String(format: "%.2f", rotation.z)
        
    }
}

