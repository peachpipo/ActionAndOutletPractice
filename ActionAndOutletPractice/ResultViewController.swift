//
//  ResultViewController.swift
//  ActionAndOutletPractice
//
//  Created by lijensu on 2021/1/24.
//

import UIKit

class ResultViewController: UIViewController {
    var tdeeComponent:Tdee!
    var bmr:Int!
    
    @IBOutlet weak var lostWeightLabel: UILabel!
    @IBOutlet weak var tdeeLabel: UILabel!
    @IBOutlet weak var gainWeightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmr=calTdee()
        tdeeLabel.text=String(bmr)
        
        var intake:String=String(intakecCalulation(bmr: bmr, percent: 90))
        let mildLose:String="Mild weight loss 0.25 kg/week: "+intake+" Calories"
        intake=String(intakecCalulation(bmr: bmr, percent:79))
        let Lose:String="Normal weight loss 0.5 kg/week: "+intake+" Calories"
        
        intake=String(intakecCalulation(bmr: bmr, percent:110))
        let mildGain:String="Mild weight gain 0.25 kg/week: "+intake+" Calories"
        
        intake=String(intakecCalulation(bmr: bmr, percent:121))
        let gain:String="Normal weight gain 0.5 kg/week: "+intake+" Calories"
        
        intake=String(intakecCalulation(bmr: bmr, percent:141))
        let fastLose:String="Fast Weight gain 1 kg/week: "+intake+" Calories"

        lostWeightLabel.text = mildLose+"\n"+Lose
   
        gainWeightLabel.text=mildGain+"\n"+gain+"\n"+fastLose
        
        
    }
    
    
    func calTdee()->Int{
        
        let weight:Double=tdeeComponent.weight
        let height:Double=tdeeComponent.height
        let sex=tdeeComponent.gender
        let bodyFat:Double=tdeeComponent.bodyFat
        let act:Int=tdeeComponent.act
        
        var BMR:Double
        var LBM:Double!
        
        if bodyFat==0
        {
            
            if sex==0
            {  LBM  = 0.407*Double(weight)+0.267*height-19.2}
            else if sex==1
            {  LBM = 0.252*weight+0.473*height-48.3}
            
        }else
        {
            LBM=(weight*Double(((100-bodyFat)/100)))
        }
        BMR = 370 + (21.6*LBM)
        
        if act==0
        {
            BMR=BMR*1.2
        }
        if act>=1 && act<3
        {
            BMR=BMR*1.375
        }
        if act>=3 && act<5
        {
            BMR=BMR*1.55
        }
        if act>=5 && act<7
        {
            BMR=BMR*1.725
        }
        if act>=7
        {
            BMR=BMR*1.9
        }
        

        return Int(BMR)
    }
    
    func intakecCalulation(bmr:Int, percent:Int) -> Int {
        let intake:Int
        
        intake=bmr*percent/100
        
        return intake
    }
}
