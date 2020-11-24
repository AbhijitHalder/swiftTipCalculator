//
//  ViewController.swift
//  Abhijit-Halder_COMP2125-Sec001_Lab03_Ex02
//
//  Created by Abhijit Halder on 2020-11-16.
//  Copyright © 2020 Abhijit Halder. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtBillAmount: UITextField!
    @IBOutlet weak var lblTipPercentage: UILabel!
    @IBOutlet weak var sldrTipPercentage: UISlider!
    @IBOutlet weak var lblCustomTipPercentage: UILabel!
    @IBOutlet weak var lblDefaultTipAmount: UILabel!
    @IBOutlet weak var lblCustomTipAmount: UILabel!
    @IBOutlet weak var lblDefaultTotal: UILabel!
    @IBOutlet weak var lblCustomTotal: UILabel!
    
    override func viewDidLoad() {
    super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func valueChange(_ sender: UISlider) {
        let billAmount = Double(txtBillAmount.text ?? "")?.roundTo(places: 2) ?? 0
        let percentage = Int(sender.value)
        lblCustomTipPercentage.text = "\(percentage)%"
        lblTipPercentage.text = "Tip Percentage: \(percentage)%"
        let defaultTip = ((Double(15) * billAmount )/100.0).roundTo(places: 2)
        let customTip = ((Double(percentage) * billAmount )/100.0).roundTo(places: 2)
        lblDefaultTipAmount.text = "$\(defaultTip)"
        lblCustomTipAmount.text = "$\(customTip)"
        let defaultTotal = defaultTip + billAmount
        let customTotal = customTip + billAmount
        lblDefaultTotal.text = "$\(defaultTotal)"
        lblCustomTotal.text = "$\(customTotal)"    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
extension Double {
    func roundTo(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
