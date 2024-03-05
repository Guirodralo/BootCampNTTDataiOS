//
//  SegundaViewController.swift
//  LocalizacionApp
//
//  Created by Guillermo Rodríguez ALonso on 5/3/24.
//

import UIKit


class SegundaViewController: UIViewController {
    //MARK: - Variables
    let myDelegate = UIApplication.shared.delegate as! AppDelegate

    @IBAction func closeVC(_ sender: Any) {
        self.myDelegate.canRotate = false
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myDelegate.canRotate = true
        // Do any additional setup after loading the view.
    }
    


}
