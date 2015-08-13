//
//  ViewController.swift
//  OLLIE_Thomas
//
//  Created by Thomas on 2015/8/13.
//  Copyright © 2015年 Thomas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var robot: RKConvenienceRobot!
    var ledOn = false
    
    @IBAction func disconnect(sender: UIButton) {
        if self.robot != nil {
            changeLED()
        }
    }
    @IBOutlet weak var connectionLable: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "appWillResignActive:", name: UIApplicationWillChangeStatusBarFrameNotification, object: nil)
        
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
        startDiscovery ()
    
    }

    
    
    func handleRobotStateChangeNotification(notification:RKRobotChangedStateNotification){
        let noteRobot = notification.robot
        switch(notification.type){
            case .Connecting:
            connectionLable.text = "\(noteRobot.name())connecting"
            break
        case .Disconnected:
            connectionLable.text = "Disconnected"
            startDiscovery()
            self.robot = nil
            break
        case .Online :
            self.robot = RKConvenienceRobot(robot: noteRobot)
            connectionLable.text = self.robot.name()
            break
        default:print("state change:\(notification.type)")
            break
        }
    }
    func startDiscovery(){
        self.connectionLable.text = "Discovering"
        RKRobotDiscoveryAgent.startDiscovery()
    }
    
    func changeLED(){
        if self.robot != nil {
            if ledOn == true{
                self.robot.setLEDWithRed(0.0, green: 1.0, blue: 0.0)
            }else{
                self.robot.setLEDWithRed(1.0, green: 0.0, blue: 0.0)
            }
            ledOn = !ledOn
        }
    }

}

