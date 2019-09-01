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
    @IBOutlet weak var darkModeSwitch: UISwitch!
    @IBOutlet var entireView: UIView!
    @IBOutlet weak var darkModeLabel: UILabel!
    @IBOutlet weak var billAmountLabel: UILabel!
    @IBOutlet weak var tipStaticLabel: UILabel!
    @IBOutlet weak var totalStaticLabel: UILabel!
    @IBOutlet weak var splitWithLabel: UILabel!
    @IBOutlet weak var personLabel: UILabel!
    
    var pickerData: [Int] = [Int]()
    var picked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.splitPicker.delegate = self
        self.splitPicker.dataSource = self
        pickerData = [0, 1, 2, 3, 4]
        self.billField.becomeFirstResponder()
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
        if (darkModeSwitch.isOn){
        splitPicker.setValue(UIColor.white, forKey: "textColor")
        }
        else {
            splitPicker.setValue(UIColor.black, forKey: "textColor")
        }
    }

    @IBAction func onTap(_ sender: Any) {
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
    @IBAction func turnOnDarkMode(_ sender: Any) {
        if darkModeSwitch.isOn {
            navigationController?.navigationBar.barTintColor = UIColor.init(displayP3Red: 0.1, green: 0.1, blue: 0.1, alpha: 0.9)
            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
            entireView.backgroundColor = UIColor.init(displayP3Red: 0.125, green: 0.125, blue: 0.125, alpha: 0.9)
            tipLabel.textColor = UIColor.white
            totalLabel.textColor = UIColor.white
            splitLabel.textColor = UIColor.white
            darkModeLabel.textColor = UIColor.white
            billAmountLabel.textColor = UIColor.white
            tipStaticLabel.textColor = UIColor.white
            totalStaticLabel.textColor = UIColor.white
            splitWithLabel.textColor = UIColor.white
            personLabel.textColor = UIColor.white
            billField.backgroundColor = UIColor.init(displayP3Red: 0.25, green: 0.25, blue: 0.25, alpha: 0.9)
            billField.textColor = UIColor.white
        }
        else {
            navigationController?.navigationBar.barTintColor = UIColor.white
            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
            entireView.backgroundColor = UIColor.white
            tipLabel.textColor = UIColor.black
            totalLabel.textColor = UIColor.black
            splitLabel.textColor = UIColor.black
            darkModeLabel.textColor = UIColor.black
            billAmountLabel.textColor = UIColor.black
            tipStaticLabel.textColor = UIColor.black
            totalStaticLabel.textColor = UIColor.black
            splitWithLabel.textColor = UIColor.black
            personLabel.textColor = UIColor.black
            billField.backgroundColor = UIColor.init(displayP3Red: 0.93, green: 0.93, blue: 0.95, alpha: 0.9)
            billField.textColor = UIColor.black
        }
    }
}

