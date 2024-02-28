//
//  ListaContactosViewController.swift
//  NTTDataTask
//
//  Created by Guillermo Rodríguez ALonso on 28/2/24.
//

import UIKit

protocol ListaContactosViewControllerProtocol {
    func reloadDataInView()
}


class ListaContactosViewController: UIViewController {
    //MARK: - ID
    var presenter: ListaContactosPresenterProtocol?
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var listaContactosTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter?.viewDidLoadInPresent()
        self.setupTableView()
        // Do any additional setup after loading the view.
    }
    
    private func setupTableView() {
        self.listaContactosTableView.delegate = self
        self.listaContactosTableView.dataSource = self
        self.listaContactosTableView.register(UINib(nibName: "ContactosCell", bundle: nil), forCellReuseIdentifier: "ContactosCell")
    }
    
}


//MARK: - ListaContactosViewControllerProtocol
extension ListaContactosViewController: ListaContactosViewControllerProtocol {
    
    func reloadDataInView() {
            self.listaContactosTableView.reloadData()
    }
    
}



extension ListaContactosViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellContactos = self.listaContactosTableView.dequeueReusableCell(withIdentifier: "ContactosCell", for: indexPath) as! ContactosCell
        
        if let modelData = self.presenter?.informationCell(indexPath: indexPath.row) {
            cellContactos.configCell(data: modelData)
        }
        return cellContactos
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
