//
//  InfoViewController.swift
//  AppHolaMundoChallenge
//
//  Created by Guillermo Rodríguez ALonso on 21/2/24.
//

import UIKit

class InfoViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    
    //MARK: - IBAction
    
    @IBAction func mostrarInfoAction(_ sender: Any) {
        
        nameLabel.text = "Mi nombre es: Guillermo"
        ageLabel.text = "Mi edad es: 24"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}
