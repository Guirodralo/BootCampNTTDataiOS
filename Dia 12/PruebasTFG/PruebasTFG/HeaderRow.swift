//
//  HeaderRow.swift
//  PruebasTFG
//
//  Created by Guillermo Rodríguez ALonso on 12/3/24.
//

import SwiftUI

extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}


struct HeaderRow: View {
    
    @State private var searchFavorite = false
    
    var body: some View {
        HStack {
            Spacer()
            Text("Mensajes")
                .font(.title)
                .bold()
                .foregroundStyle(Color(hex: 0x4090ce))
            Spacer()
            
            if searchFavorite {
                Image(systemName: "star.fill")
                    .font(.title)
                .foregroundStyle(.yellow)
            } else {
                Image(systemName: "star.fill")
                    .font(.title)
                .foregroundStyle(.gray)
            }
            
            Toggle(isOn: $searchFavorite) {
            }
            .labelsHidden()
            .padding()
            .tint(Color(hex: 0x4090ce))
        }
    }
}

#Preview {
    HeaderRow()
}
