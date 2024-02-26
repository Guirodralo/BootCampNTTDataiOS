//
//  PerfilViewController.swift
//  AppTableViewDemo2
//
//  Created by Guillermo Rodríguez ALonso on 26/2/24.
//

import UIKit

protocol PerfilViewControllerProtocol {
    
}

class PerfilViewController: UIViewController {

    
    //MARK: - Injection dependencies
    var presenter: PerfilPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}

extension PerfilViewController: PerfilViewControllerProtocol {
    
}
