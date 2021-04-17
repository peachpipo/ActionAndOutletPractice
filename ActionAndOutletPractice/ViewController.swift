//
//  ViewController.swift
//  ActionAndOutletPractice
//
//  Created by lijensu on 2021/1/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var genderSegControl: UISegmentedControl!
    @IBOutlet weak var weightText: UITextField!
    @IBOutlet weak var heightText: UITextField!
    @IBOutlet weak var fatText: UITextField!
    @IBOutlet weak var ageText: UITextField!
    @IBOutlet weak var actText: UITextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        genderSegControl.selectedSegmentIndex=0
        weightText.text=""
        heightText.text=""
        fatText.text=""
        ageText.text=""
        actText.text=""
    
    }
    
    @IBSegueAction func showResult( _ coder: NSCoder) -> ResultViewController? {
        let controller = ResultViewController(coder: coder)
        let gender = genderSegControl.selectedSegmentIndex
        let weight = Double(weightText.text!) ?? 0
        let height = Double(heightText.text!) ?? 0
        let fat = Double(fatText.text!) ?? 0
        let age = Int(ageText.text!) ?? 0
        let act = Int(actText.text!) ?? 0
        controller?.tdeeComponent = Tdee(gender: gender, weight: weight, height: height, bodyFat: fat, age: age, act:act)
        
        
        
        return controller
    }


    
    
    
}

