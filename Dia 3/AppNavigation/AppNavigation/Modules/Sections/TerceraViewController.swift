//
//  TerceraViewController.swift
//  AppNavigation
//
//  Created by Guillermo Rodríguez ALonso on 23/2/24.
//

import UIKit

class TerceraViewController: UIViewController {
    //MARK: - Variables locales
    var codigoPostalDataSource = ["28001", "08001", "39001", "47001"]
    var ciudadDataSource = ["Madrid", "Barcelona", "Santander", "Valladolid"]
    var posicionGeograficaDataSource = ["40.413531, -3.707703", "41.374704, 2.149552", "43.485504, -3.779724", "41.649569, -4.730434"]
    
    //MARK: - Variables globales
    var variables = GlobalUserData()
    
    
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var apellidoLabel: UILabel!
    @IBOutlet weak var movilLabel: UILabel!
    @IBOutlet weak var direccionLabel: UILabel!
    @IBOutlet weak var edadPerroLabel: UILabel!
    @IBOutlet weak var codigoPostalTextField: UITextField!
    @IBOutlet weak var ciudadTextField: UITextField!
    @IBOutlet weak var posicionGeograficaTextField: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Ventana 3"
        self.navigationController?.navigationBar.backgroundColor = .red
          
        showInfo()
        
        makePV()
        
    }
    
    
    private func showInfo() {
         self.nombreLabel.text = variables.nombreData
        self.apellidoLabel.text = variables.apellidoData
        self.movilLabel.text = variables.movilData
        self.direccionLabel.text = variables.direccionData
        self.edadPerroLabel.text = variables.edadPerroData
    }
    
    private func makePV() {
        
        //PickerView en codigo postal
        self.codigoPostalTextField.inputView = createPickerView(myTextField: codigoPostalTextField, myArray: codigoPostalDataSource, myTag: 0, myDelegate: self, myDataSourcePicker: self)
        self.codigoPostalTextField.text = codigoPostalDataSource[0]
        
        //PickerView en Ciudad
        self.ciudadTextField.inputView = createPickerView(myTextField: ciudadTextField, myArray: ciudadDataSource, myTag: 1, myDelegate: self, myDataSourcePicker: self)
        self.ciudadTextField.text = ciudadDataSource[0]
        
        //PickerView en posicion Geografica
        self.posicionGeograficaTextField.inputView = createPickerView(myTextField: posicionGeograficaTextField, myArray: posicionGeograficaDataSource, myTag: 2, myDelegate: self, myDataSourcePicker: self)
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    
    
    
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "V4" {
            
            if !(self.codigoPostalTextField.text?.isEmpty ?? false) && !(self.ciudadTextField.text?.isEmpty ?? false) && !(self.posicionGeograficaTextField.text?.isEmpty ?? false) {
                
                let vc4 = segue.destination as! CuartaViewController
                vc4.variables.nombreData = self.variables.nombreData
                vc4.variables.apellidoData = self.variables.apellidoData
                vc4.variables.movilData = self.variables.movilData
                vc4.variables.direccionData = self.variables.direccionData
                vc4.variables.edadPerroData = self.variables.edadPerroData
                vc4.variables.codigoPostalData = self.codigoPostalTextField.text
                vc4.variables.codigoPostalData = self.codigoPostalTextField.text
                
            } else {
                present(displayAlertVC(myTitle: "Cuidado", myMessage: "rellena el CP, ciudad y posicion geografica"), animated: true, completion: nil)
            }
            
        }
    }
    
}

// MARK: - UIPickerViewDelegate
extension TerceraViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0:
            return codigoPostalDataSource[row]
        case 1:
            return ciudadDataSource[row]
        default:
            return posicionGeograficaDataSource[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0:
            codigoPostalTextField.text = codigoPostalDataSource[row]
        case 1:
            ciudadTextField.text = ciudadDataSource[row]
        default:
            posicionGeograficaTextField.text = posicionGeograficaDataSource[row]
        }
    }
}


//MARK: - UIPickerViewDataSource
extension TerceraViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0:
            return codigoPostalDataSource.count
        case 1:
            return ciudadDataSource.count
        default:
            return posicionGeograficaDataSource.count
        }
    }
    
    
}
