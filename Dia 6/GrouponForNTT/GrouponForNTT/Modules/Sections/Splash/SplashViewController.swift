//
//  SplashViewController.swift
//  GrouponForNTT
//
//  Created by Guillermo Rodríguez ALonso on 4/3/24.
//

import UIKit

protocol SplashViewControllerProtocol {
    func reloadInformationInView()
}

class SplashViewController: BaseViewController<SplashPresenterProtocol>, ReuseIdentifierViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.fetchDataFromPresent()

        // Do any additional setup after loading the view.
    }



}


extension SplashViewController: SplashViewControllerProtocol {
    func reloadInformationInView() {
        //
    }
    
    
}
