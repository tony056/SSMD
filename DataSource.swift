//
//  DataSource.swift
//  Lecture5-TableView
//
//  Created by TUNGYING-CHAO on 8/3/15.
//  Copyright © 2015 TUNGYING-CHAO. All rights reserved.
//

import UIKit

class DataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var names = ["Apple", "Bee", "Cindy", "Dad", "Egg", "Fog"]
    
    let textCellIdentifier = "TextCell"
    
    var index = 0
    
    override init() {
       
            while true {
                names.append(String(index))
                
                index++
                
                if index == 10
                {
                    break
                }
                

            
        }
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.names.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as UITableViewCell
        
        let row = indexPath.row
        cell.textLabel?.text = names[row]
        
        return cell
    }
    
}
