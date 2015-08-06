//
//  Student.swift
//  Leture5-TableView_Celine
//
//  Created by CelineChien on 2015/8/3.
//  Copyright © 2015年 CelineChien. All rights reserved.
//

import Foundation

class Student : Human {
    
    var grade : Int = 0
    var gpa : Double = 0
    var credits : Int = 0
    
    
    init(grade: Int, gpa: Double, credits: Int, name: String, gender:Bool){
        super.init(name: name, gender: gender)
        self.setGrade(grade)
        self.setGpa(gpa)
        self.setCredits(credits)
    }
        
    
    func setGrade(grade: Int){
        self.grade = grade
        super.setGender(!super.gender)
    }
    
    
    func setGpa(gpa: Double){
        self.gpa = gpa
        
    }
    
    
    func setCredits(credits: Int){
        self.credits = credits
        
    }
    
    
    func sayGpa() -> String{
        return String(self.gpa)
        
    }
 
    func sayGender() -> String {
        return String(self.gender)
        
        
    }
    
    
    
    
    
}