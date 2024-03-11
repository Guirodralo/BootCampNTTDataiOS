//
//  ContentView.swift
//  ToDoList-MVVM
//
//  Created by Guillermo Rodríguez ALonso on 11/3/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var notesViewModel = NotesViewModel()
    
    @State var descriptionNote: String = ""
    
    var body: some View {
        NavigationView {
            VStack{
                Text("Añadir una tarea")
                    .underline()
                    .foregroundStyle(.gray)
                    .padding(.horizontal, 16)
                
                TextEditor(text: $descriptionNote)
                    .foregroundStyle(.gray)
                    .frame(height: 100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.green, lineWidth: 2)
                    )
                    .padding(.horizontal, 12)
                    .clipShape(RoundedRectangle(cornerRadius: 3))
                
                Button("Crear") {
                    if !(descriptionNote == "") {
                        notesViewModel.saveNote(description: descriptionNote)
                        descriptionNote = ""
                    }
                }
                .buttonStyle(.bordered)
                .tint(.green)
                
                Spacer()
                
                List {
                    ForEach($notesViewModel.notes, id: \.id) { $note in
                        HStack {
                            if note.isFavorited {
                                Image(systemName: "star.fill")
                                    .bold()
                                    .foregroundStyle(.yellow)
                            }
                            Text(note.description)
                        }
                        .swipeActions(edge: .trailing) {
                            Button {
                                notesViewModel.updateFavoriteNote(notes: $note)
                            } label: {
                                Label("Favorito", systemImage: "star.fill")
                            }
                            .tint(.yellow)
                        }
                        .swipeActions(edge: .leading) {
                            Button {
                                notesViewModel.removeNote(withId: note.id)
                            } label: {
                                Label("Borrar", systemImage: "trash.fill")
                            }
                            .tint(.red)
                        }
                    }
                }
                .navigationTitle("ToDoList")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Text(notesViewModel.getNumberOfNotes())
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
