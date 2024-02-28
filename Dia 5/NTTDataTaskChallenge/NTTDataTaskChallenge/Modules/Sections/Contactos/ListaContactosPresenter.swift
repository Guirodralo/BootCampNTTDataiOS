//
//  ListaContactosPresenter.swift
//  NTTDataTaskChallenge
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
    
    let vc: ListaContactosViewController?
    var arrayContactos: [ArrayContact] = []
    var router: ListaContactoRouterProtocol?
    
    init(vc: ListaContactosViewController?) {
        self.vc = vc
    }
    
}


extension ListaContactosPresenter: ListaContactosPresenterProtocol {
    func showDetailContacto(dto: ArrayContact) {
        self.router?.showDetail(dto: dto)
    }
    
    func viewDidLoadInPresent() {
        if let model = ContactosModel.stubbedContacts {
            self.arrayContactos = model
            self.vc?.reloadDataInView()
        }
    }
    
    
    func informationCell(indexPath: Int) -> ArrayContact {
        return self.arrayContactos[indexPath]
    }
    
    func numberOfRowInSection() -> Int {
        return self.arrayContactos.count
    }
    
    
}
