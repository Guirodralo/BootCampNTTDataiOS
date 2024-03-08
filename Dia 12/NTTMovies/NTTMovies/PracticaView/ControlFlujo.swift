//
//  ControlFlujo.swift
//  NTTMovies
//
//  Created by Guillermo Rodríguez ALonso on 7/3/24.
//

import SwiftUI

struct ControlFlujo: View {
    
    @State private var showActionSheet = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HeaderComponent()
                Divider()
                
                Button(action: {
                    self.showActionSheet.toggle()
                }) {
                    HStack {
                        Image(systemName: "play")
                        Text("Muestra un ActionSheet")
                    }
                    .font(.title)
                    .foregroundStyle(.black)
                }.actionSheet(isPresented: self.$showActionSheet, content: {
                    ActionSheet(title: Text("Action Sheet"),
                                message: Text("Esta es una hoja de acciones"),
                                buttons: [.default(Text("Boton 1"), action: {
                        //Esta es la accion del boton 1
                    }), .default(Text("Boton 2"), action: {
                        //Esta es la accion del boton 2
                    }), .cancel({
                        //Accion de cancelar
                    })])
                })
                
            }
        }
    }
}


#Preview {
    ControlFlujo()
}

