//
//  DataSource.swift
//  Leture5-TableView_Celine
//
//  Created by CelineChien on 2015/8/3.
//  Copyright © 2015年 CelineChien. All rights reserved.
//

import UIKit

class DataSource: NSObject, UITableViewDataSource, UITableViewDelegate {

    
    var names = ["Apple","Bee","Cindy","Dad","Egg","Fog"]
    
    let textCellIdentifier = "TextCell"
    
    
    
    
    
override init() {
    
    //   for index in 0...10{
    //       names.append(String(index))
    //        }
    
   var x = 0
    
    while x <= 10  {
        
      names.append(String(x))
       x++
    
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

    
    
