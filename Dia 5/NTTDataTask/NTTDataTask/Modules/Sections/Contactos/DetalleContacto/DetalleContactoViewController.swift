//
//  DetalleContactoViewController.swift
//  NTTDataTask
//
//  Created by Guillermo Rodríguez ALonso on 28/2/24.
//

import UIKit

protocol DetalleContactoViewControllerProtocol {
    func reloadDataModel()
}

class DetalleContactoViewController: UIViewController {
    
    //MARK: - ID
    var presenter: DetalleContactoPresenterProtocol?
    
    //MARK: - IBOutlets
    @IBOutlet weak var detalleContactostableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.getDataModel()
        self.setupTableView()
        // Do any additional setup after loading the view.
    }
    
    private func setupTableView() {
        self.detalleContactostableView.delegate = self
        self.detalleContactostableView.dataSource = self
        self.detalleContactostableView.register(UINib(nibName: "ContactosCell", bundle: nil), forCellReuseIdentifier: "ContactosCell")
    }
    
}


extension DetalleContactoViewController: DetalleContactoViewControllerProtocol {
    func reloadDataModel() {
        self.detalleContactostableView.reloadData()
    }
    
    
    
}


//MARK: - Extension TableView
extension DetalleContactoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellContactos = self.detalleContactostableView.dequeueReusableCell(withIdentifier: "ContactosCell", for: indexPath) as! ContactosCell
        
        if let modelData = self.presenter?.informationData() {
            cellContactos.configCell(data: modelData)
        }
        return cellContactos
    }
    
    
}

