//
//  ListaTareasViewController.swift
//  NTTDataTask
//
//  Created by Guillermo Rodríguez ALonso on 29/2/24.
//

import UIKit

class ListaTareasViewController: UIViewController {
    
    var dowloads: [DownloadNewModel]?
    
    //MARK: - IBOutlets
    @IBOutlet weak var listaTareaTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
        // Do any additional setup after loading the view.
    }
    
    func setupView() {
        SaveFavoritesPresenter.shared.getAllLocal { (results) in
            self.dowloads = results?.downloads
        } failure: { (error) in
            print(error ?? "La hemos liado")
        }

    }
    
    func setupTableView() {
        self.listaTareaTableView.delegate = self
        self.listaTareaTableView.dataSource = self
        self.listaTareaTableView.register(UINib(nibName: "ListaTareaCell", bundle: nil), forCellReuseIdentifier: "ListaTareaCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupView()
        self.listaTareaTableView.reloadData()
    }
    
}


extension ListaTareasViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dowloads?.count ?? 0
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellDownload = self.listaTareaTableView.dequeueReusableCell(withIdentifier: "ListaTareaCell", for: indexPath) as! ListaTareaCell
        cellDownload.myNombreLabel.text = self.dowloads?[indexPath.row].newTask
        return cellDownload
    }
    
}
