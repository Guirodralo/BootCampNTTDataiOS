//
//  SplashInteractor.swift
//  GrouponForNTT
//
//  Created by Guillermo Rodríguez ALonso on 4/3/24.
//

import Foundation

protocol SplashInteractorProtocol {
    func fetchData()
}


class SplashInteractor: BaseInteractor<SplashPresenterProtocol> {
    
    let provider: SplashProviderProtocol = SplashProvider()
    
    
}


extension SplashInteractor: SplashInteractorProtocol {
    func fetchData() {
        provider.fetchData()
    }
}
