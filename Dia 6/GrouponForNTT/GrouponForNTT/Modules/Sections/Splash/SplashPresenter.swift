//
//  SplashPresenter.swift
//  GrouponForNTT
//
//  Created by Guillermo Rodríguez ALonso on 4/3/24.
//

import Foundation

protocol SplashPresenterProtocol {
     func fetchDataFromPresent()
}

protocol SplashInteractorOutputProtocol {
    
    func getDataFromBusiness(data: [CardBusinessModel]?)
}

class SplashPresenter: BasePresenter<SplashViewControllerProtocol, SplashRouterProtocol, SplashInteractorProtocol> {
    
    var arrayData: [CardBusinessModel] = []
    
}


extension SplashPresenter: SplashPresenterProtocol {
    func fetchDataFromPresent() {
        self.interactor?.fetchData()
    }
    
    
}

extension SplashPresenter: SplashInteractorOutputProtocol {
    func getDataFromBusiness(data: [CardBusinessModel]?) {
        
        if let dataDes = data {
            self.arrayData = dataDes
            self.vc?.reloadInformationInView()
        }
    }
    
    
}
