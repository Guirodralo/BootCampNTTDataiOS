//
//  ListaCochesPresenter.swift
//  AppTableViewDemo2
//
//  Created by Guillermo Rodríguez ALonso on 26/2/24.
//

import Foundation
import UIKit


protocol ListaCochesPresenterProtocol {
    
    func setArrayData()
    func numberOfRowCell() -> Int
    func getInformationCellForRow(indexPath: Int) -> CochesModel
}


final class ListaCochesPresenter {
    
    let vc: ListaCochesViewController?
    var arrayCoches = [CochesModel]()
    
    init(vc: ListaCochesViewController) {
        self.vc = vc
    }

    
}

extension ListaCochesPresenter: ListaCochesPresenterProtocol {
    func setArrayData() {
        self.arrayCoches.removeAll()
        self.arrayCoches = [CochesModel(name: "audi", color: "Rojo", image: UIImage(named: "audi")),
                            CochesModel(name: "Renault", color: "Azul", image: UIImage(named: "audi")),
                            CochesModel(name: "Skoda", color: "Verde", image: UIImage(named: "audi")),
                            CochesModel(name: "audi", color: "Rojo", image: UIImage(named: "audi")),
                            CochesModel(name: "Renault", color: "Azul", image: UIImage(named: "audi")),
                            CochesModel(name: "Skoda", color: "Verde", image: UIImage(named: "audi")),
                            CochesModel(name: "audi", color: "Rojo", image: UIImage(named: "audi")),
                            CochesModel(name: "Renault", color: "Azul", image: UIImage(named: "audi")),
                            CochesModel(name: "Skoda", color: "Verde", image: UIImage(named: "audi")),
                            CochesModel(name: "audi", color: "Rojo", image: UIImage(named: "audi")),
                            CochesModel(name: "Renault", color: "Azul", image: UIImage(named: "audi")),
                            CochesModel(name: "Skoda", color: "Verde", image: UIImage(named: "audi"))]
        self.vc?.reloadData()
    }
    
    func numberOfRowCell() -> Int {
        return self.arrayCoches.count
    }
    
    func getInformationCellForRow(indexPath: Int) -> CochesModel {
        return self.arrayCoches[indexPath]
    }
}

