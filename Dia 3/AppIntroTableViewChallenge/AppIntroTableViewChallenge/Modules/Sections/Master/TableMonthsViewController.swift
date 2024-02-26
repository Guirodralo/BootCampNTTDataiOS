//
//  TableMonthsViewController.swift
//  AppIntroTableViewChallenge
//
//  Created by Guillermo Rodríguez ALonso on 26/2/24.
//
//
//  TableMonthsViewController.swift
//  AppIntroTableViewChallenge
//
//  Created by Guillermo Rodríguez ALonso on 26/2/24.
//

import UIKit

class TableMonthsViewController: UIViewController {
    //MARK: - Variables
    var arrayMonths = ["Enero", "Febrero", "Marzo", "Abril"]
        
    //MARK: - IBOutlets
    @IBOutlet weak var myTableViewMonths: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
    
    private func setupTableView() {
        self.myTableViewMonths.delegate = self
        self.myTableViewMonths.dataSource = self
        self.myTableViewMonths.register(UINib(nibName: "MonthsTableViewCell", bundle: nil), forCellReuseIdentifier: "MonthsTableViewCell")
    }
    
}


extension TableMonthsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Que pasa
        let vc = DetailCoordinator.view(dto: DetailCoordinatorDTO(nameMonth: self.arrayMonths[indexPath.row]))
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


extension TableMonthsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellMonths = self.myTableViewMonths.dequeueReusableCell(withIdentifier: "MonthsTableViewCell", for: indexPath) as! MonthsTableViewCell
        cellMonths.setupCell(name: self.arrayMonths[indexPath.row])
        return cellMonths
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayMonths.count
    }
    
    
}
