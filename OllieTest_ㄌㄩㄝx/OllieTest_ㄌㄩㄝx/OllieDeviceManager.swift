//
//  OllieDeviceManager.swift
//  OllieTest_ㄌㄩㄝx
//
//  Created by CelineChien on 2015/8/17.
//  Copyright © 2015年 CelineChien. All rights reserved.
//

import UIKit

class OllieDeviceManager: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var ollieBLE : RKRobotLE?
    var ollie : RKOllie!
    var deviceList = [RKRobotLE]()
    var robotCellIdentifier: String = "robotCell"
    
    override init() {
        super.init()
    }
    
    func startDiscovery(){
        RKRobotDiscoveryAgentLE.sharedAgent().stopDiscovery()
        RKRobotDiscoveryAgentLE.sharedAgent().connectStrategy = RKNoConnectStrategy()
        RKRobotDiscoveryAgentLE.sharedAgent().startDiscovery()
    }
    
    func stopDiscovery(){
        RKRobotDiscoveryAgentLE.sharedAgent().stopDiscovery()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(robotCellIdentifier, forIndexPath: indexPath) as UITableViewCell
        let row = indexPath.row
        cell.textLabel?.text = deviceList[row].name()
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deviceList.count
    }
    
    func disconnect(){
        self.ollie.disconnect()
    }
    
    func setBLE(index: Int){
        self.ollieBLE = self.deviceList[index]
    }
    
    func connectToTheOllie() {
        print("1")
        if self.ollieBLE == nil {
            return
        }
        print("2")
        self.ollie = RKOllie(robot: self.ollieBLE)
        RKRobotDiscoveryAgentLE.connect(self.ollie.robot)
        print("3")
    }
    
    func moveRight(heading: Float, velocity: Float) {
        self.ollie.driveWithHeading(90, andVelocity: velocity)
    }
    
    func getOllie() -> RKOllie {
        return self.ollie
    }
    
    func getDeviceListLength() -> Int {
        return self.deviceList.count
    }
    
    func isContainTheRobot(robot: RKRobotLE) -> Bool {
        return self.deviceList.contains(robot)
    }
    
    func addRobotToList(robot: RKRobotLE){
        self.deviceList.append(robot)
    }
    
    

}
