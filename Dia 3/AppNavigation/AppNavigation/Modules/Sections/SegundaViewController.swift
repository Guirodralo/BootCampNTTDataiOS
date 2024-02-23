//
//  SegundaViewController.swift
//  AppNavigation
//
//  Created by Guillermo Rodríguez ALonso on 23/2/24.
//

import UIKit

class SegundaViewController: UIViewController {
    //MARK: - Variables globales
    var variables = GlobalUserData()
    var edadReal: Int?
    
    //MARK: - IBOutlets
    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var apellidoLabel: UILabel!
    @IBOutlet weak var movilTextField: UITextField!
    @IBOutlet weak var direccionTextField: UITextField!
    @IBOutlet weak var edadPerroTextField: UITextField!
    @IBOutlet weak var edadPerroLabel: UILabel!
    
    
    //MARK: - IBActions
    
    @IBAction func calculoEdadPerroButton(_ sender: Any) {
        
        if !(self.edadPerroTextField.text?.isEmpty ?? false) {
            self.edadReal = (Int(self.edadPerroTextField.text ?? "")!) * 7
            
            self.edadPerroLabel.text! = " La edad de mi perro es " + String(edadReal!)
            
        } else {
            present(displayAlertVC(myTitle: "Hola", myMessage: "Tienes que poner edad al perro"), animated: true, completion: nil)
        }
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Lo que hago con esto es cambiar titulo del navigationItem y el color de fondo
        self.navigationItem.title = "Ventana 2"
        self.navigationController?.navigationBar.backgroundColor = .red
        
        showInfo()
        
        

    }
    
    private func showInfo() {
        self.nombreLabel.text = variables.nombreData
        self.apellidoLabel.text = variables.apellidoData
        self.movilTextField.keyboardType = .numberPad
        self.edadPerroTextField.keyboardType = .numberPad
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "V3" {
            
            if !(self.movilTextField.text?.isEmpty ?? false) && !(self.direccionTextField.text?.isEmpty ?? false) && !(self.edadPerroTextField.text?.isEmpty ?? false) {
                
                let vc3 = segue.destination as! TerceraViewController
                
                vc3.variables.nombreData = self.variables.nombreData
                
                vc3.variables.apellidoData = self.variables.apellidoData
                
                vc3.variables.movilData = self.movilTextField.text
                
                vc3.variables.direccionData = self.direccionTextField.text
                
                vc3.variables.edadPerroData = self.edadPerroTextField.text
                
            } else {
                present(displayAlertVC(myTitle: "Cuidado", myMessage: "Tienes que rellenar el movil, la direccion y la edad de tu perro"), animated: true, completion: nil)
            }
            
        }
    }


}
