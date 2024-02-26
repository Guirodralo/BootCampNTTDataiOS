//
//  ListaCochesViewController.swift
//  AppTableViewDemo2
//
//  Created by Guillermo Rodríguez ALonso on 26/2/24.
//

import UIKit

protocol ListaCochesViewProtocol {
    func reloadData()
}

class ListaCochesViewController: UIViewController {

    //MARK: - Injection dependencies
    var presenter: ListaCochesPresenterProtocol?
    
    //MARK: - IBOutlets
    @IBOutlet weak var myTableViewCoches: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Lista de Coches"
        self.presenter?.setArrayData()
        setupTableView()
        // Do any additional setup after loading the view.
    }


    private func setupTableView() {
        self.myTableViewCoches.delegate = self
        self.myTableViewCoches.dataSource = self
        self.myTableViewCoches.register(UINib(nibName: "CochesTableViewCell", bundle: nil), forCellReuseIdentifier: "CochesTableViewCell")
    }

}

//MARK: - ListaCochesViewProtocol
extension ListaCochesViewController: ListaCochesViewProtocol {
    func reloadData() {
        self.myTableViewCoches.reloadData()
    }
}

//MARK: - UITableViewDataSource
extension ListaCochesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.numberOfRowCell() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellCoches = self.myTableViewCoches.dequeueReusableCell(withIdentifier: "CochesTableViewCell", for: indexPath) as! CochesTableViewCell
        if let modelData = self.presenter?.getInformationCellForRow(indexPath: indexPath.row) {
            cellCoches.configCell(model: modelData)
        }
        return cellCoches

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

//MARK: - UITableViewDelegate
extension ListaCochesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
}

