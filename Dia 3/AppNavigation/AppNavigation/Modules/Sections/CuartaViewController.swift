//
//  CuartaViewController.swift
//  AppNavigation
//
//  Created by Guillermo Rodríguez ALonso on 23/2/24.
//

import UIKit

class CuartaViewController: UIViewController {
    //MARK: - Variables globales
    var variables = GlobalUserData()
    
    //MARK: - IBOOutlets
    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var apellidoLabel: UILabel!
    @IBOutlet weak var movilLabel: UILabel!
    @IBOutlet weak var direccionLabel: UILabel!
    @IBOutlet weak var edadPerroLabel: UILabel!
    @IBOutlet weak var codigoPostalLabel: UILabel!
    @IBOutlet weak var ciudadLabel: UILabel!
    @IBOutlet weak var posicionGeograficaLabel: UILabel!
    @IBOutlet weak var fechaTextField: UITextField!
    
    
    @IBAction func showDatePicker(myTextField: UITextField) {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        myTextField.inputView = datePicker
        datePicker.addTarget(self, action: #selector(DatePickerValueChanged(_:)), for: .valueChanged)
    }
    
    @objc
    func DatePickerValueChanged(_ myCustomDatePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        self.fechaTextField.text = dateFormatter.string(from: myCustomDatePicker.date)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showInfo()
    }
    
    
    private func showInfo() {
         self.nombreLabel.text = variables.nombreData
        self.apellidoLabel.text = variables.apellidoData
        self.movilLabel.text = variables.movilData
        self.direccionLabel.text = variables.direccionData
        self.edadPerroLabel.text = variables.edadPerroData
        self.codigoPostalLabel.text = variables.codigoPostalData
        self.ciudadLabel.text = variables.cuidadData
        self.posicionGeograficaLabel.text = variables.posicionGeograficaData
    }


    
    @IBAction func popAllViews(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
