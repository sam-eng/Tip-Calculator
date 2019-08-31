//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Samantha Eng on 8/31/19.
//  Copyright © 2019 Samantha Eng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var splitPicker: UIPickerView!
    @IBOutlet weak var splitLabel: UILabel!
    
    var pickerData: [Int] = [Int]()
    var picked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.splitPicker.delegate = self
        self.splitPicker.dataSource = self
        pickerData = [0, 1, 2, 3, 4]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(pickerData[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        picked = pickerData[row]
        calculateTip(self)
    }

    @IBAction func onTap(_ sender: Any) {
        print("Hello")
        
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billField.text!) ?? 0
        
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let splitBill = total/Double((picked + 1))
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        splitLabel.text = String(format: "$%.2f", splitBill)
    }
}

