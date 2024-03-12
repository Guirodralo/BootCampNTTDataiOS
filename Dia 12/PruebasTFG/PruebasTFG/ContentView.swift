//
//  ContentView.swift
//  PruebasTFG
//
//  Created by Guillermo Rodríguez ALonso on 12/3/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var contactos: [ContactosModel] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                HeaderRow()
                List {
                    ForEach(contactos) { persona in
                        ZStack {
                            HStack {
                                ItemRow(contacto: persona)
                                    .overlay(Rectangle().stroke(.gray, lineWidth: 0.5))
                            }
                            
                            NavigationLink(destination: DetalleContactoView(contacto: persona)){
                                EmptyView()
                            }
                            .opacity(0)
                            
                            
                        }.listRowInsets(EdgeInsets())
                    }
                }
                .frame(maxWidth: .infinity)
                .onAppear {
                    cargarDatos()
                }
                .listStyle(.plain)
            }
        }
        
    }
    
    
    
    func cargarDatos() {
        if let fileURL = Bundle.main.url(forResource: "perfiles", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileURL)
                let decoder = JSONDecoder()
                self.contactos = try decoder.decode([ContactosModel].self, from: data)
            } catch {
                print("Error cargando datos desde JSON: \(error)")
            }
        } else {
            print("No encontrado el archivo JSON")
        }
    }
}
#Preview {
    ContentView()
}
