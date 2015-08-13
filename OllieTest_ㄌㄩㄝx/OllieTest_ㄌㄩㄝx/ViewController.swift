//
//  ViewController.swift
//  OllieTest_ㄌㄩㄝx
//
//  Created by CelineChien on 2015/8/13.
//  Copyright © 2015年 CelineChien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var robot: RKConvenienceRobot!
    var ledOn = false
    
    @IBOutlet weak var connectionLabel: UILabel!
    
   
    @IBAction func disconnectOllie(sender:
        UIButton) {
            if self.robot != nil {
                changeLED()
            }
    
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "appWillResignActive:" , name: UIApplicationWillResignActiveNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "appDidBecomeActive:", name: UIApplicationDidBecomeActiveNotification, object: nil)
        
        RKRobotDiscoveryAgent.sharedAgent().addNotificationObserver(self, selector: "handleRobotStateChangeNotification:")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func appWillResignActive(note: NSNotification){
        RKRobotDiscoveryAgent.disconnectAll()
        RKRobotDiscoveryAgent.stopDiscovery()
        
    }
    
    func appDidBecomeActive(note: NSNotification){
        startDiscovery()
        
    }
    
    func handleRobotStateChangeNotification(notification:
        RKRobotChangedStateNotification){
        let noteRobot = notification.robot
            switch(notification.type){
            case .Connecting:
                connectionLabel.text = "\(noteRobot.name())connecting"
                
                break
            case.Disconnected: connectionLabel.text = "Disconnected"
            startDiscovery()
            self.robot = nil
                
                break
            case . Online: self.robot = RKConvenienceRobot(robot: noteRobot)
                connectionLabel.text = self.robot.name()
                changeLED()
                break
            default:
                print("state change: \(notification.type)")
                
                break
           
            }
    
    }
    
    func startDiscovery(){
        self.connectionLabel.text = "Discovering"
        RKRobotDiscoveryAgent.stopDiscovery()
        RKRobotDiscoveryAgent.startDiscovery()
        
    }
    
    func changeLED(){
        if self.robot != nil {
            
            if ledOn == true {
                
                self.robot.setLEDDefaultWithRed(1.0, green: 0.0, blue: 0.0)
                
            }else{
                self.robot.setLEDDefaultWithRed(1.0, green: 0.0, blue: 1.0)
                
                }
            ledOn = !ledOn
            
        }
    }
    
    
}

