//
//  ListaContactosViewController.swift
//  NTTDataTaskChallenge
//
//  Created by Guillermo Rodríguez ALonso on 28/2/24.
//

import Foundation
import UIKit

protocol ListaContactosViewControllerProtocol {
    func reloadDataInView()
}


class ListaContactosViewController: UIViewController {
    //MARK: - ID
    var presenter: ListaContactosPresenterProtocol?
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var myTablaContactos: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoadInPresent()
        self.setupTableView()
        // Do any additional setup after loading the view.
    }
    
    private func setupTableView() {
        self.myTablaContactos.dataSource = self
        self.myTablaContactos.delegate = self
        self.myTablaContactos.register(UINib(nibName: "ContactosCell", bundle: nil), forCellReuseIdentifier: "ContactosCell")
    }
    
}

extension ListaContactosViewController: ListaContactosViewControllerProtocol {
    
    func reloadDataInView() {
        self.myTablaContactos.reloadData()
    }
}


extension ListaContactosViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellContact = self.myTablaContactos.dequeueReusableCell(withIdentifier: "ContactosCell", for: indexPath) as! ContactosCell
        
        if let modelData = self.presenter?.informationCell(indexPath: indexPath.row) {
            cellContact.configCell(data: modelData)
        }
        
        return cellContact
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let modelData = self.presenter?.informationCell(indexPath: indexPath.row) {
            self.presenter?.showDetailContacto(dto: modelData)
        }
    }
    
    
    
}
