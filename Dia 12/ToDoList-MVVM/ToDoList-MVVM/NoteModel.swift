//
//  NoteModel.swift
//  ToDoList-MVVM
//
//  Created by Guillermo Rodríguez ALonso on 11/3/24.
//

import SwiftUI

struct NoteModel: Codable {
    let id: String
    var isFavorited: Bool
    let description: String
    
    init(id: String = UUID().uuidString, isFavorited: Bool = false, description: String) {
        self.id = id
        self.isFavorited = isFavorited
        self.description = description
    }
}
