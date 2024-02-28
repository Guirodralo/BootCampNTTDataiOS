//
//  ListaContactosPresenter.swift
//  NTTDataTask
//
//  Created by Guillermo Rodríguez ALonso on 28/2/24.
//

import Foundation

protocol ListaContactosPresenterProtocol {
    func viewDidLoadInPresent()
    func numberOfRowInSection() -> Int
    func informationCell(indexPath: Int) -> ArrayContact
    func showDetailContacto(dto: ArrayContact)
}

final class ListaContactosPresenter {
    
    //MARK: - Variables
    var arrayContactos: [ArrayContact] = []
    let vc: ListaContactosViewController?
    var router: ListaContactoRouterProtocol?
    
    init(vc: ListaContactosViewController?) {
        self.vc = vc
    }
}


extension ListaContactosPresenter: ListaContactosPresenterProtocol {
    func showDetailContacto(dto: ArrayContact) {
        self.router?.showDetail(dto: dto)
    }
    
    func informationCell(indexPath: Int) -> ArrayContact {
        return self.arrayContactos[indexPath]
    }
    
    func numberOfRowInSection() -> Int {
        return self.arrayContactos.count
    }
    
    func viewDidLoadInPresent() {
        
        if let model = ContactosModel.stubbedContacts
        {
            self.arrayContactos = model
            self.vc?.reloadDataInView()
        }
    }
    
    
    
    
    
}
