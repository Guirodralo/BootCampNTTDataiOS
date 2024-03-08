//
//  HeaderComponent.swift
//  NTTMovies
//
//  Created by Guillermo Rodríguez ALonso on 7/3/24.
//

import SwiftUI

struct HeaderComponent: View {
    var body: some View {
        VStack(spacing: 20) {
            CustomTitle(title: "Vistas y modificadores")
            CustomSubtitle(subtitle: "Conceptos basicos")
            CustomDescription(description: "Construir una vista en swiftUI es muy facil y lo que hace es basicamente contener subvistas")
        }
    }
}

#Preview {
    HeaderComponent()
}


struct CustomTitle: View {
    
    var title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                .foregroundStyle(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}


struct CustomSubtitle: View {
    
    var subtitle: String
    
    var body: some View {
        
        VStack {
            Text(subtitle)
                .padding(.horizontal, 20)
                .font(.custom("Arial", size: 18))
                .foregroundStyle(Color.gray)
        }
    }
}


struct CustomDescription: View {
    
    var description: String
    
    var body: some View {
        
        VStack {
            Text(description)
                .padding(20)
                .font(.title)
                .foregroundStyle(Color.black)
                .frame(maxWidth: .infinity)
                .background(Color.orange)
                
        }
    }
}
