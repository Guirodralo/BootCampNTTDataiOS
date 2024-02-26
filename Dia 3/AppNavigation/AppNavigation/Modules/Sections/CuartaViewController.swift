//
//  CuartaViewController.swift
//  AppNavigation
//
//  Created by Guillermo Rodríguez ALonso on 23/2/24.
//

import UIKit
import MessageUI

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
    
    
    // MARK: - IBACtions
    @IBAction func showDatePicker(myTextField: UITextField) {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        myTextField.inputView = datePicker
        datePicker.addTarget(self, action: #selector(DatePickerValueChanged(_:)), for: .valueChanged)
    }
    
    @IBAction func enviarMail(_ sender: Any) {
        
        if MFMailComposeViewController.canSendMail() {
            present(configuracionMailComposeVC(), animated: true, completion: nil)
        }else {
            present(displayAlertVC(myTitle: "Hey", myMessage: "no puedes mandar mails"), animated: true, completion: nil)
        }
        
    }
    
    
    private func configuracionMailComposeVC() -> MFMailComposeViewController {
        
        let mailComp = MFMailComposeViewController()
        mailComp.mailComposeDelegate = self
        mailComp.setToRecipients([""])
        mailComp.setSubject("")
        let emailBody = "Nombre: \(nombreLabel.text ?? "") \n Apellido: \(apellidoLabel.text ?? "") \n Telefono: \(movilLabel.text ?? "") \n Direccion: \(direccionLabel.text ?? "") \n Edad de mi perro: \(edadPerroLabel.text ?? "") \n Codigo postal: \(codigoPostalLabel.text ?? "") \n Ciudad: \(ciudadLabel.text ?? "") \n Posicion geofrafica: \(posicionGeograficaLabel.text ?? "") \n fecha Tutoria: \(fechaTextField.text ?? "")"
        
        mailComp.setMessageBody(emailBody, isHTML: false)
        return mailComp
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


extension CuartaViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}
