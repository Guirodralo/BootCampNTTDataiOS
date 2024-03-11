//
//  CustomNavigationView.swift
//  NTTMovies
//
//  Created by Guillermo Rodríguez ALonso on 8/3/24.
//

import SwiftUI

struct CustomNavigationView: View {
    var body: some View {

        ZStack {
            Text("Seasons")
                .font(.system(size: 20))
            HStack(spacing: 10) {
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "slider.horizontal.3")
                })
                Spacer()
                Button(action: {
                    
                }, label: {
                    Image(systemName: "magnifyingglass")
                })
                Button(action: {
                    
                }, label: {
                    Image(systemName: "alarm")
                })
                Button(action: {
                    
                }, label: {
                    Image(systemName: "cart")
                })
            }
            .font(.callout)
            .foregroundStyle(.black)
        }
        .background(.white)
        .padding(.horizontal, 12)
        
    }
}

//#Preview {
//    CustomNavigationView()
//}
