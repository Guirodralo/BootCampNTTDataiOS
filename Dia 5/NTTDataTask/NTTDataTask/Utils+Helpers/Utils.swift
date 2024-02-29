//
//  Utils.swift
//  NTTDataTask
//
//  Created by Guillermo Rodríguez ALonso on 29/2/24.
//

import Foundation
import UIKit


class Utils {
    
    static let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
    
    static let dateFormatter: DateFormatter = {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-mm-dd"
        return dateFormater
    }()
}
