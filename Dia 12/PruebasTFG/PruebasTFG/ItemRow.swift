//
//  ContactosView.swift
//  PruebasTFG
//
//  Created by Guillermo Rodríguez ALonso on 12/3/24.
//

import SwiftUI

struct ItemRow: View {
    
    let contacto: ContactosModel
    
    
    var body: some View {
        HStack(spacing: 10) {
            Image(contacto.imagen ?? "perfil")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .shadow(radius: 10)
                .padding()
            
            VStack(alignment: .leading) {
                Text(contacto.nombre ?? "Anonimo")
                Text("\(contacto.edad ?? 0)")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        //.overlay(Rectangle().stroke(.gray, lineWidth: 2))
    }
}

#Preview {
    ItemRow(contacto: ContactosModel(id: 1, nombre: "Alberto", edad: 20, imagen: "perfil", telefono: "634423138"))
}
