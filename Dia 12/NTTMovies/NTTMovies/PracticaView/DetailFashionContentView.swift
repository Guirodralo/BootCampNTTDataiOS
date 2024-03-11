//
//  DetailFashionContentView.swift
//  NTTMovies
//
//  Created by Guillermo Rodríguez ALonso on 11/3/24.
//

import SwiftUI

struct DetailFashionContentView: View {
    
    var model: Row
    
    var body: some View {
        Image(model.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: .infinity, maxHeight: 600)
            .clipped()
    }
}

#Preview {
    DetailFashionContentView(model: Row(id: 0, name: "Fir and Flame", image: "p1", price: "€199"))
}
