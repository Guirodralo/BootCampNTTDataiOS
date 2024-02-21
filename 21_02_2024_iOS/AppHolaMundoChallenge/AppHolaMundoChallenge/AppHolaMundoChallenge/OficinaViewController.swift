//
//  OficinaViewController.swift
//  AppHolaMundoChallenge
//
//  Created by Guillermo Rodríguez ALonso on 21/2/24.
//

import UIKit

class OficinaViewController: UIViewController {
//MARK: -IBOutlets
    @IBOutlet weak var direccionLabel: UILabel!
    @IBOutlet weak var provinciaLabel: UILabel!
    @IBOutlet weak var direccionButton: UIButton!
    
    
    
    
    
//MARK: -IBActions
    @IBAction func cambioDireccionAction(_ sender: Any) {
        
        if direccionButton.titleLabel?.text == "Direccion Madrid" {
            direccionLabel.text = "Direccion:  Novus Building, Cam. de la Fuente de la Mora, 1, Hortaleza, 28050"
            provinciaLabel.text = "Provincia: Madrid"
            direccionButton.setTitle("Direccion Valladolid", for: .normal)
        } else {
            direccionLabel.text = "Direccion: C. María de Molina, 7, 4°"
            provinciaLabel.text = "Provincia: Valladolid"
            direccionButton.setTitle("Direccion Madrid", for: .normal)
        }
            
        
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        direccionLabel.text = "Direccion: C. María de Molina, 7, 4°"
        provinciaLabel.text = "Provincia: Valladolid"
    }

}
