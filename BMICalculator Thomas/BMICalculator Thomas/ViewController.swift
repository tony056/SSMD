//
//  ViewController.swift
//  BMICalculator Thomas
//
//  Created by Thomas on 2015/7/27.
//  Copyright © 2015年 Thomas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weightTextField:
        UITextField!
    
    
    
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var resuitDisplay:
        UILabel!
    
    @IBAction func calculateBMI
        (sender: UIButton) {
            
            if checkTextFieldEmpty() {
                self.resuitDisplay.text = "請輸入數字!!!"
                
            }
            else{
                let weight : Double = Double(weightTextField.text!)!
                let height : Double = Double(heightTextField.text!)!
                let bmiValue = returnBMI(weight, height :height) //resturnBMI()funtion
                
                resuitDisplay.text = String(format:"%.2f",bmiValue)
                //self.自己家的lable的名字.text = checkStatus(裡面放的參數自己想想要放哪個
                self.bmiResulDisplay.text = checkStatus(bmiValue)
            }
            
            
    }
    
    @IBOutlet weak var bmiResulDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkTextFieldEmpty()-> Bool{
        return (Double(weightTextField.text!)
            == nil) || (Double(heightTextField.text!) == nil)

    }
    
    func returnBMI(weigh: Double, height: Double) -> Double{
        var value :Double = 0
        //計算
        value = weigh / (height * height/10000.0)
        return value
    }
    
    func checkStatus(bmiValue: Double) -> String{
        //if, else if, else if,else
        var status : String = ""
        if bmiValue < 18.5 { //bmiValue是否介於15島20之間
            status = "過輕"
        }
        else if bmiValue >= 18.5 && bmiValue < 24 {
            status = "正常"
        }
        else if bmiValue >= 24 && bmiValue < 27 {
            status = "過重"
        }
        else if bmiValue >= 27 && bmiValue < 30 {
            status = "輕度肥胖"
        }
        else if bmiValue >= 30 && bmiValue < 35 {
            status = "中度肥胖"
        }
        else {
            status = "重度肥胖"
        }
        return status 
    }
    


}

