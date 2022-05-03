//
//  ViewController.swift
//  BMICalculator
//
//  Created by Summer Lin on 5/3/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var metricSwitch: UISwitch!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var lblDescriptor: UILabel!
    @IBOutlet weak var txtWeight: UITextField!
    @IBOutlet weak var txtHeightInFeet: UITextField!
    @IBOutlet weak var txtHeightInInch: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func metricSwitchChanged(_ sender: UISwitch) {
        if sender.isOn {
            txtWeight.placeholder = "Weight(kg)"
            txtHeightInFeet.placeholder = "Height(cm)"
            txtHeightInInch.isHidden = true
        }
        else {
            txtWeight.placeholder = "weight in lbs"
            txtHeightInFeet.placeholder = "height in feet"
            txtHeightInInch.isHidden = false
        }
    }
    
    @IBAction func calculateBMIAction(_ sender: Any) {
        lblResult.isHidden = false
        //whether metric or not
        if metricSwitch.isOn == true {
            //transfer into double
            let weight:Double = Double(txtWeight.text ?? "0") ?? 0.0
            let height:Double = Double(txtHeightInFeet.text ?? "0") ?? 0.0
            if height <= 0 && weight <= 0  {
                lblResult.text = "Please fill out your height and weight."
            } else {
                //BMI= weight（KG） ÷ height（CM）^2；
                let result = weight / (pow(height/100, 2))
                let resultStr = String.init(format: "Your BMI is :%.2f", result)
                lblResult.text = resultStr
                var descriptor : String
                            if(result < 18.5) { descriptor = "Underweight" }
                            else if(result < 24.9) { descriptor = "Healthy weight" }
                            else if(result < 29.9) { descriptor = "Overweight" }
                            else { descriptor = "Obese" }
                let descriptorStr = String(format: "You are:%.2f", descriptor)
                lblResult.text = resultStr
                lblDescriptor.text = descriptorStr
                print(result)
                print(descriptor)
            }
        } else {
            let weight:Double = Double(txtWeight.text ?? "0") ?? 0.0
            let height_f:Double = Double(txtHeightInFeet.text ?? "0") ?? 0.0
            let height_i:Double = Double(txtHeightInInch.text ?? "0") ?? 0.0
            if weight <= 0 && height_f <= 0 && height_i <= 0 {
                lblResult.text = "Please fill out your height and weight."
            } else {
                //kg =lb / 2.2046; 1inch= 2.54cm；1ft = 12in
                let w_kg = weight / 2.2046
                let h_inch = height_f * 12.0 + height_i
                let h_metric = h_inch * 2.54 / 100.0
                let result = w_kg / h_metric / h_metric
                let resultStr = String.init(format: "Your BMI is :%.2f", result)
                var descriptor : String
                            if(result < 18.5) { descriptor = "Underweight" }
                            else if(result < 24.9) { descriptor = "Healthy weight" }
                            else if(result < 29.9) { descriptor = "Overweight" }
                            else { descriptor = "Obese" }
                let descriptorStr = "You are: \(descriptor)"
                lblResult.text = resultStr
                lblDescriptor.text = descriptorStr
                print(result)
                print(descriptor)
            }
        }
        
    }
}

