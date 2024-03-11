//
//  NotesViewModel.swift
//  ToDoList-MVVM
//
//  Created by Guillermo Rodríguez ALonso on 11/3/24.
//

import Foundation
import SwiftUI

final class NotesViewModel: ObservableObject {
    @Published var notes: [NoteModel] = []
    
    init() {
        notes = getAllNotes()
    }
    
    func saveNote(description: String) {
        
        let newNote = NoteModel(description: description)
        notes.insert(newNote, at: 0)
        encodeAndSaveAllNotes()
    }

    private func encodeAndSaveAllNotes() {
        if let enconded = try? JSONEncoder().encode(notes) {
            
            UserDefaults.standard.set(enconded, forKey: "notes")
            
        }
    }
    
    func getAllNotes() -> [NoteModel] {
        
        if let notesData = UserDefaults.standard.object(forKey: "notes") as? Data {
            
            if let notes = try? JSONDecoder().decode([NoteModel].self, from: notesData) {
                return notes
            }
            
        }
        return []
    }
    
    func removeNote(withId id: String) {
        notes.removeAll(where: {$0.id == id})
        encodeAndSaveAllNotes()
    }
    
    func updateFavoriteNote(notes: Binding<NoteModel>) {
        
        notes.wrappedValue.isFavorited = !notes.wrappedValue.isFavorited
        encodeAndSaveAllNotes()
    }
    
    func getNumberOfNotes() -> String {
        "\(notes.count)"
    }
}
