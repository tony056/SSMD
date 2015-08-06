//
//  ViewController.swift
//  BMICalculalor_Celine
//
//  Created by CelineChien on 2015/7/27.
//  Copyright © 2015年 CelineChien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var bMIResultDisplay: UILabel!
    
    
    @IBOutlet weak var WeightTextField: UITextField!
    
    @IBOutlet weak var HeightTextField: UITextField!
    
    @IBOutlet weak var numberDisplay: UILabel!
    
    
    @IBAction func calculateBMI(sender: UIButton)
    {
        
        //var TextFieldisEmpty : Bool = (Double(WeightTextField.text!) == nil) || (Double(HeightTextField.text!) == nil)
    
        if checkTextFieldEmpty() {
            self.numberDisplay.text = "打字啊!!"
        }
        else{
          
            let weight : Double = Double(WeightTextField.text!)!
        
                let height : Double = Double(HeightTextField.text!)!
    
            let bmivalue : Double = returnBMI(weight , height : height ) //   換成returnBMI()
            
               self.numberDisplay.text = String(format: "%.2f", bmivalue)
            
            self.bMIResultDisplay.text = checkstatus(bmivalue)
            
            
            
            //self.自己加的label的名字.text = checlStatus(裡面放參數)
        }
    
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func checkTextFieldEmpty() -> Bool {
        
        return (Double(WeightTextField.text!) == nil) || (Double(HeightTextField.text!) == nil)
        
    }
    
    func returnBMI(weight: Double, height: Double) -> Double {
        var value : Double = 0
        
        //計算
        value = weight / (height * height)
        
        return value
        
    }
    
    
    func checkstatus(bmiValus: Double) -> String {
        //if, else if, else if, else
        
        var status : String = ""
        if bmiValus < 18.5 { //bmivalue是否介於15到20之間
            
            status = "紙片"
        }
        else if bmiValus >= 18.5 && bmiValus < 24 {
             status = "正常人"
        }
           
        
        else if bmiValus > 24 && bmiValus < 29.5 {
             status = "小胖子"
        }
           
        
        else {
           
            status = "大胖子"
            
        }
        
        
        
        
     return status
    }




}





























