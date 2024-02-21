//
//  ViewController.swift
//  AppHolaMundo
//
//  Created by Guillermo Rodríguez ALonso on 21/2/24.
//

import UIKit

class ViewController: UIViewController {
    
    //    MARK: - IBOutlet
    
    @IBOutlet weak var holaMundoLBL: UILabel!
    @IBOutlet weak var saludaSolLBL: UILabel!
    @IBOutlet weak var consTrailingPrimerLBL: NSLayoutConstraint!
    
//    MARK: - IBActions
    
    @IBAction func CambiaNombreACTION(_ sender: Any) {
        holaMundoLBL.text = "Hola BootCamp iOS Everis"
        saludaSolLBL.text = "Hola Sol y Luna"
        consTrailingPrimerLBL.constant = 50
    }
    
    
    //    MARK: - life VC
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Aqui estamos a tope")
    }
    
    
}

//    MARK: - Extension VC
