//
//  DetalleContactoView.swift
//  PruebasTFG
//
//  Created by Guillermo Rodríguez ALonso on 12/3/24.
//

import SwiftUI

struct DetalleContactoView: View {
    
    let contacto: ContactosModel
    
    var body: some View {
        VStack {
            Image(contacto.imagen ?? "perfil")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .overlay(Circle().stroke(.black, lineWidth: 2))
                .shadow(radius: 10)
                .padding()
            
            
            HStack {
                Text(contacto.nombre ?? "Anonimo")
                    .font(.title)
                Text("\(contacto.edad ?? 0)")
                    .font(.title)
                
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom, 10)
            
            Text(contacto.telefono ?? "")
                .font(.title3)
                .frame(maxWidth: .infinity)
            
            
            
            
            Spacer()
        }
    }
}

#Preview {
    DetalleContactoView(contacto: ContactosModel(id: 1, nombre: "Alberto", edad: 20, imagen: "perfil", telefono: "634423138", isFavorite: true))
}
