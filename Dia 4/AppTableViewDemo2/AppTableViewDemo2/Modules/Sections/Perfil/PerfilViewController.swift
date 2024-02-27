//
//  PerfilViewController.swift
//  AppTableViewDemo2
//
//  Created by Guillermo Rodríguez ALonso on 26/2/24.
//

import UIKit

protocol PerfilViewControllerProtocol {
    func reloadData()
}

class PerfilViewController: UIViewController {
    
    
    //MARK: - Injection dependencies
    var presenter: PerfilPresenterProtocol?
    
    //MARK: - IBOutlets
    @IBOutlet weak var myTableViewPerfil: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Perfil"
        self.presenter?.viewDidLoad()
        setupTableView()
        
        // Do any additional setup after loading the view.
    }
    
    private func setupTableView() {
        self.myTableViewPerfil.delegate = self
        self.myTableViewPerfil.dataSource = self
        self.myTableViewPerfil.register(UINib(nibName: "PerfilTableViewCell", bundle: nil), forCellReuseIdentifier: "PerfilTableViewCell")
    }
    
}

extension PerfilViewController: PerfilViewControllerProtocol {
    
    internal func reloadData() {
        self.myTableViewPerfil.reloadData()
    }
}

extension PerfilViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return presenter?.getDataCellForRowPost() ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            let cellPerfil = myTableViewPerfil.dequeueReusableCell(withIdentifier: "PerfilTableViewCell", for: indexPath) as! PerfilTableViewCell
            if let modelData = self.presenter?.getInfomationPerfilCell() {
                cellPerfil.configCell(model: modelData)
            }
            return cellPerfil
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 215
        default:
            return UITableView.automaticDimension
        }
    }
}
