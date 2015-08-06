//
//  Human.swift
//  Leture5-TableView_Celine
//
//  Created by CelineChien on 2015/8/3.
//  Copyright © 2015年 CelineChien. All rights reserved.
//

import Foundation


class Human {
    
    var name : String = "haha"
    var gender : Bool = true
    var height : Double = 0.0
    var weight : Double = 0.0
    
    init(name: String, gender: Bool){
        
        changeName(name)
        setGender(gender)
        
        
        
    }
    
 
    func sayName() -> String{
        return self.name
        
    }
    
    
    func changeName(name: String){
        self.name = name
        
    }
    
    
    func setGender(gender: Bool){
        self.gender = gender
        
    }
    
}