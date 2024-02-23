//
//  ViewController.swift
//  AppNavigation
//
//  Created by Guillermo Rodríguez ALonso on 22/2/24.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var nombreTF: UITextField!
    @IBOutlet weak var apellidoTF: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Ventana 2"
        self.navigationController?.navigationBar.backgroundColor = .red
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueV2"{
            
            if !(self.nombreTF.text?.isEmpty ?? false) && !(self.apellidoTF.text?.isEmpty ?? false) {
                
                let vc2 = segue.destination as! SegundaViewController
                vc2.variables.nombreData = self.nombreTF.text
                vc2.variables.apellidoData = self.apellidoTF.text
                
            } else {
                present(displayAlertVC(myTitle: "Hey", myMessage: "Tienes que rellenar el formulario"), animated: true, completion: nil)
            }
            
        }
    }
    
    
}
