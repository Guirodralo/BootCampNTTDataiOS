//
//  SplashViewController.swift
//  GrouponForNTT
//
//  Created by Guillermo Rodríguez ALonso on 4/3/24.
//

import UIKit

protocol SplashViewControllerProtocol {
    
}

class SplashViewController: BaseViewController<SplashPresenterProtocol>, ReuseIdentifierViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }



}


extension SplashViewController: SplashViewControllerProtocol {
    
}
