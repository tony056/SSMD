//
//  ViewController.swift
//  Lecture5-TableView
//
//  Created by TUNGYING-CHAO on 7/30/15.
//  Copyright © 2015 TUNGYING-CHAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let tableViewManager : DataSource = DataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let tony = Human(name: "Tony", gender: true, weight: 66, height: 1.73)
//        print(tony.sayName())
        
        tableView.delegate = tableViewManager
        
        tableView.dataSource = tableViewManager
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

