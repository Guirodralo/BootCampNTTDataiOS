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


class SplashInteractor: BaseInteractor<SplashInteractorOutputProtocol> {
    
    let provider: SplashProviderProtocol = SplashProvider()
    
    private func transformData(data: [Card]) -> [CardBusinessModel] {
        var arrayData: [CardBusinessModel] = []
        for index in 0..<data.count{
            let obj = CardBusinessModel(data: CardDataBusinessModel(isAutoRefundEnabled: data[index].data?.isAutoRefundEnabled ?? false))
            arrayData.append(obj)
        }
        return arrayData
    }
    
}


extension SplashInteractor: SplashInteractorProtocol {
    func fetchData() {
        provider.fetchData { [weak self] (result) in
            guard self != nil else { return }
            
            self?.presenter?.getDataFromBusiness(data: self?.transformData(data: result.cards ?? []))
            
        } failure: {  (error) in
            //
        }
        
    }
}
