//
//  ViewController.swift
//  Lecture6-coreMotion_才不告訴你咧x
//
//  Created by CelineChien on 2015/8/6.
//  Copyright © 2015年 CelineChien. All rights reserved.
//

import UIKit

import CoreMotion

class ViewController: UIViewController {
    
    var motionManager = CMMotionManager() //data label
    
    @IBOutlet weak var accelX: UILabel!
    
    @IBOutlet weak var accelY: UILabel!
    
    @IBOutlet weak var accelZ: UILabel!
    
    @IBOutlet weak var gyroX: UILabel!
    
    @IBOutlet weak var gyroY: UILabel!
    
    @IBOutlet weak var gyroZ: UILabel!
    
    

    override func viewDidLoad() {
     
        motionManager.accelerometerUpdateInterval = 0.2 //每0.2秒更新ㄧ次值
        
        motionManager.gyroUpdateInterval = 0.2 //同上,只是把要更新值的改成是陀螺儀
        
        motionManager.startAccelerometerUpdatesToQueue (NSOperationQueue.currentQueue()!, withHandler: { (accelData: CMAccelerometerData?, error: NSError?) -> Void in
            self.outputAccelData(accelData!.acceleration)
            if error != nil{
                print("\(error)")
                
            }
            
//            self.outputAccelData(accel: CMAcceleration)
            
        })
        
        motionManager.startGyroUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler: {(gyroData:CMGyroData?, error: NSError?) ->Void in
            self.outputRotationData(gyroData!.rotationRate)
            if error != nil{
                print("\(error)")
                
            }
        
        })
            super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func outputAccelData(accel: CMAcceleration) //這個型別是加速度計,我們可以拿到Y X Z得值   
    {
        accelX.text = String (format: "%.2f", accel.x)
        accelY.text = String (format: "%.2f", accel.y)
        accelZ.text = String (format: "%.2f", accel.z)
        
           }
    

    func outputRotationData(rotation: CMRotationRate) {
        
        gyroX.text = String(format: "%.2f", rotation.x)
        gyroY.text = String(format: "%.2f", rotation.y)
        gyroZ.text = String(format: "%.2f", rotation.z)
    
    }











}



