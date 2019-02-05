//
//  ViewController.swift
//  TipCalculator
//
//  Created by Akarsh Kumar on 2/4/19.
//  Copyright © 2019 Akarsh Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var inputString = ""{
        didSet{
            update();
        }
    };
    
    @IBOutlet weak var inputAmountLabel: UILabel!;
    
    @IBOutlet weak var tipPercentSlider: UISlider!
    
    @IBOutlet weak var tipPercentSliderLabel: UILabel!
    
    @IBOutlet weak var tipAmountLabel: UILabel!;
    
    @IBOutlet weak var finalAmountLabel: UILabel!;
    
    @IBAction func tipPercentSliderChanged(_ sender: UISlider) {
        tipPercentSliderLabel.text = "Tip Percent: \(Int(sender.value))%";
        update();
    }
    @IBAction func numberPressed(_ sender: UIButton) {
        print("\(sender.currentTitle!)");
        inputString += sender.currentTitle!;
    }
    @IBAction func periodPressed(_ sender: UIButton) {
        inputString += ".";
        update();
    }
    
    @IBAction func backspacePressed(_ sender: UIButton) {
        if(inputString.count > 0){
            let temp = inputString.index(String.Index(encodedOffset: 0), offsetBy: inputString.count-1);
            
            inputString = String(inputString[..<temp]);
            update();
        }
    }
    
    
    private func update(){
        
        let tipPercent = Double(tipPercentSlider.value);
        var inputAmount = 0.0
        
        if let inputAmount_ = Double(inputString){
            inputAmount = inputAmount_;
            inputAmountLabel.text = inputString;
        }
        else{
            inputAmountLabel.text = "0.0";
        }
        
        let tipAmount = calculateTip(amountPaid: inputAmount, tipPercent: tipPercent);
        let finalAmount = tipAmount + inputAmount;
        
        let tipAmountStr = String(format: "%.2f", tipAmount);
        tipAmountLabel.text = tipAmountStr;
        let finalAmountStr = String(format: "%.2f", finalAmount);
        finalAmountLabel.text = finalAmountStr;
    }
    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    private func calculateTip(amountPaid: Double, tipPercent: Double) -> Double {
        return amountPaid*tipPercent/100;
    }

}

