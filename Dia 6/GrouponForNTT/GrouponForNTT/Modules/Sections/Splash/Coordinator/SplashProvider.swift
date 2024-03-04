//
//  SplashProvider.swift
//  GrouponForNTT
//
//  Created by Guillermo Rodríguez ALonso on 4/3/24.
//

import Foundation

protocol SplashProviderProtocol {
    func fetchData()
}

class SplashProvider {
    
    let networkService: NetworkServiceProtocol = NetworkService()
    
}


extension SplashProvider: SplashProviderProtocol {
    func fetchData() {
        networkService.requestGeneric(dto: RequestDTO(param: nil, method: .get, endpoint: URLEndpoint.endpointGrouponList), entityClass: EverGrouponServerModel.self) { (result) in
            //
        } failure: { (error) in
            //
        }

    }
}
