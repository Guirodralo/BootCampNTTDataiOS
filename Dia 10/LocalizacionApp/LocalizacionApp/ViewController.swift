//
//  ViewController.swift
//  LocalizacionApp
//
//  Created by Guillermo Rodríguez ALonso on 5/3/24.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var greetingLBL1: UILabel!
    @IBOutlet weak var greetingLBL2: UILabel!
    @IBOutlet weak var greetingLBL3: UILabel!
    @IBOutlet weak var greetingLBL4: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.greetingLBL1.text = LocalizedKeys.General.generalGreeting.localized
        self.greetingLBL2.text = LocalizedKeys.General.generalGreetingMorning.localized
        self.greetingLBL3.text = LocalizedKeys.General.generalGreetingEvening.localized
        self.greetingLBL4.text = LocalizedKeys.General.generalGreetingNight.localized
        // Do any additional setup after loading the view.
    }


}

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
