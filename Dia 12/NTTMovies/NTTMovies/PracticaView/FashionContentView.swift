//
//  FashionContentView.swift
//  NTTMovies
//
//  Created by Guillermo Rodríguez ALonso on 8/3/24.
//

import SwiftUI

struct FashionContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                CustomNavigationView()
                CustomMainView()
            }.navigationBarHidden(true)
        }
    }
}

#Preview {
    FashionContentView()
}
