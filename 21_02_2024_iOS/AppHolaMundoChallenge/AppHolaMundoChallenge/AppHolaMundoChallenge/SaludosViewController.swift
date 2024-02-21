//
//  ViewController.swift
//  AppHolaMundoChallenge
//
//  Created by Guillermo Rodríguez ALonso on 21/2/24.
//

import UIKit

class SaludosViewController: UIViewController {
//    MARK: -IBOulets
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var consFirstLabel: NSLayoutConstraint!
    
    
//    MARK: -IBAction

    @IBAction func cambioTextoAction(_ sender: Any) {
        
        firstLabel.text = "Formacion con NTTData"
        secondLabel.text = "Hola buenas"
        consFirstLabel.constant = 50
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

