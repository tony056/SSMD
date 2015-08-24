//
//  ViewController.swift
//  OllieTest_ㄌㄩㄝx
//
//  Created by CelineChien on 2015/8/13.
//  Copyright © 2015年 CelineChien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var ollieDeviceManager : OllieDeviceManager = OllieDeviceManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "appWillResignActive:" , name: UIApplicationWillResignActiveNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "appDidBecomeActive:", name: UIApplicationDidBecomeActiveNotification, object: nil)
    
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleAvailable:", name: kRobotIsAvailableNotification, object: nil)
        
        self.ollieDeviceManager.startDiscovery()
        
        tableView.delegate = self.ollieDeviceManager
        tableView.dataSource = self.ollieDeviceManager
    }

    func handleAvailable(notification: RKRobotAvailableNotification){
        
        if self.ollieDeviceManager.getDeviceListLength() != notification.robots.count {
            for bot in notification.robots {
             let ollieBLE = bot as! RKRobotLE
                if !self.ollieDeviceManager.isContainTheRobot(ollieBLE){
                    self.ollieDeviceManager.addRobotToList(ollieBLE)
                        
                }
            }
                tableView.reloadData()
            }
        
    }
    
    @IBOutlet weak var tableView: UITableView!

    
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
    
    func startDiscovery(){
            RKRobotDiscoveryAgent.startDiscovery()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "robotConnectSegue" { 
            let destinationViewController = segue.destinationViewController as! ButtonVersionViewController
            
            if let indexPath = tableView.indexPathForCell(sender as! UITableViewCell){
                
                self.ollieDeviceManager.setBLE(indexPath.row)
                destinationViewController.ollieDeviceManager = self.ollieDeviceManager
                print("next view")
                
                }
            
        }else if segue.identifier == "robotmoveSegue" {
            let destinationViewController = segue.destinationViewController as! JoystickViewController
        
            self.ollieDeviceManager.setBLE(getTheRowBeTapped(sender))
            destinationViewController.ollieDeviceManager = self.ollieDeviceManager
            
            print("the 2nd segue")
            
        }
    }

    func getTheRowBeTapped(sender: AnyObject?) -> Int {
        if let indexPath = tableView.indexPathForCell(sender as! UITableViewCell) {
            return indexPath.row
        }
        return 0
        }
    }



    
    


