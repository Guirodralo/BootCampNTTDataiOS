//
//  EverGrouponBusinessModel.swift
//  GrouponForNTT
//
//  Created by Guillermo Rodríguez ALonso on 4/3/24.
//

import Foundation


struct EverGrouponBusinessModel: Decodable {
    let cards: [CardBusinessModel]?
    
    init(cards: [CardBusinessModel]) {
        self.cards = cards
    }
}

struct CardBusinessModel: Decodable {
    let data: CardDataBusinessModel?
    
    init(data: CardDataBusinessModel) {
        self.data = data
    }
}


struct CardDataBusinessModel: Decodable {
    let isAutoRefundEnabled: Bool?
    
    init(isAutoRefundEnabled: Bool) {
        self.isAutoRefundEnabled = isAutoRefundEnabled
    }
}
