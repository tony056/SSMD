//
//  ViewController.swift
//  Leture5-TableView_Celine
//
//  Created by CelineChien on 2015/7/30.
//  Copyright © 2015年 CelineChien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var tableView: UITableView!
    

    
    let tableViewManager : DataSource = DataSource()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var celine = Human(name: "celine", gender: false)
        
        print(celine.sayName())
        
        var thomas = Student(grade: 1, gpa: 1, credits: 1, name: "thomas", gender: true)
        
        print(thomas.sayGpa())
        
        print(thomas.sayName())
        
        print(thomas.sayGender())
        
        tableView.delegate = tableViewManager
        
        tableView.dataSource = tableViewManager
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


