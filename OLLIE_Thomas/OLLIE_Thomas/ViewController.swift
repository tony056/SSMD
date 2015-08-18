//
//  ViewController.swift
//  OLLIE_Thomas
//
//  Created by Thomas on 2015/8/13.
//  Copyright © 2015年 Thomas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var ollieDeviceMannager :OllieDeviceManager = OllieDeviceManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "appWillResignActive:", name: UIApplicationWillChangeStatusBarFrameNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "appDidBecomeActive:", name: UIApplicationDidBecomeActiveNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleAvailable:", name: kRobotIsAvailableNotification, object: nil)
        self.ollieDeviceMannager.startDiscovery()
        
        tableView.delegate = self.ollieDeviceMannager
        tableView.dataSource = self.ollieDeviceMannager
        
    }
    func handleAvailable(notification:RKRobotAvailableNotification){
        if self.ollieDeviceMannager.getDeviceListLength() != notification.robots.count{
            for bot in notification.robots{
                let ollieBLE = bot as! RKRobotLE
                if !self.ollieDeviceMannager.isContainTheRobot(ollieBLE){
                    self.ollieDeviceMannager.addRobotToList(ollieBLE)
                }
            }
            tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func appWillResignActive(note: NSNotification){
        RKRobotDiscoveryAgent.disconnectAll()
        RKRobotDiscoveryAgent.stopDiscovery()
        }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "robotConnectSegue"{
            let destinationViewController  = segue.destinationViewController as! ButtonVersionVeiwControler
            if let indexPath = tableView.indexPathForCell(sender as! UITableViewCell){
                self.ollieDeviceMannager.setBLE(indexPath.row)
                destinationViewController.ollieDeviceManager = self.ollieDeviceMannager
                
                print("next view")
            }
    }
   
    
    
   }

    }
