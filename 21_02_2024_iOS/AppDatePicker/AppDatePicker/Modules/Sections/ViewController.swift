//
//  ViewController.swift
//  AppDatePicker
//
//  Created by Guillermo Rodríguez ALonso on 21/2/24.
//

import UIKit

class ViewController: UIViewController {
//MARK: -IBOutlets
    @IBOutlet weak var myDateLabel: UILabel!
    @IBOutlet weak var myDateTF: UITextField!
    
//MARK: -IBActions
    @IBAction func showPickerTextFieldAction(myTextField: UITextField) {
        let pickerDateView = UIDatePicker()
        pickerDateView.datePickerMode = .dateAndTime
        myTextField.inputView = pickerDateView
        pickerDateView.addTarget(self, action: #selector(DatePickerValueChanged(_:)), for: .valueChanged)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc
    func DatePickerValueChanged(_ myCustomDatePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        self.myDateLabel.text = dateFormatter.string(from: myCustomDatePicker.date)
    }


}

