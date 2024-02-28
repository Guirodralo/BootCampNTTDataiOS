//
//  ListaContactosViewController.swift
//  NTTDataTask
//
//  Created by Guillermo Rodríguez ALonso on 28/2/24.
//

import UIKit

class ListaContactosViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var listaContactosTableView: UITableView!
    
    
    
    //MARK: - Variables
    var arrayContactos: [ArrayContact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let model = ContactosModel.stubbedContacts
        {
            self.arrayContactos = model
        }
        self.setupTableView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.listaContactosTableView.reloadData()
    }
    
    private func setupTableView() {
        self.listaContactosTableView.delegate = self
        self.listaContactosTableView.dataSource = self
        self.listaContactosTableView.register(UINib(nibName: "ContactosCell", bundle: nil), forCellReuseIdentifier: "ContactosCell")
    }
    
}



extension ListaContactosViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayContactos.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellContactos = self.listaContactosTableView.dequeueReusableCell(withIdentifier: "ContactosCell", for: indexPath) as! ContactosCell
        cellContactos.configCell(data: self.arrayContactos[indexPath.row])
        return cellContactos
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
