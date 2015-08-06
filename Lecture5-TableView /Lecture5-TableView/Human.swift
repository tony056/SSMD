//
//  Human.swift
//  Lecture5-TableView
//
//  Created by TUNGYING-CHAO on 8/3/15.
//  Copyright © 2015 TUNGYING-CHAO. All rights reserved.
//

import Foundation


class Human {
    var name : String = "Haha"
    var gender : Bool = true //true: Male, false: Female
    var height : Double = 0.0
    var weight : Double = 0.0
    
    init(name: String, gender: Bool, weight: Double, height: Double){
        changeName(name)
        setGender(gender)
        setHeight(height)
        setWeight(weight)
    }
    
    //    init(){
    //
    //    }
    
    func sayName() -> String{
        return self.name
    }
    
    func changeName(name: String){
        self.name = name
    }
    
    func setWeight(weight: Double){
        self.weight = weight
    }
    
    func setHeight(height: Double){
        self.height = height
    }
    
    func setGender(gender: Bool){
        self.gender = gender
    }
    
    //    func changeGender(){
    //        self.gender = !self.gender
    //    }
}