//
//  CustomMainView.swift
//  NTTMovies
//
//  Created by Guillermo Rodríguez ALonso on 8/3/24.
//

import SwiftUI

struct CustomMainView: View {
    
    @State private var dressSelected = "Dress"
    
    var body: some View {
        
        VStack {
            HStack {
                Button(action: {
                    
                }, label: {
                    HStack {
                        Text("Casual Dress").font(.headline)
                        Spacer()
                        Image(systemName: "chevron.down").font(.title3)
                    }
                    .padding()
                })
                .foregroundStyle(.black)
                
                Button(action: {
                    
                }, label: {
                    HStack {
                        Image(systemName: "slider.horizontal.3").padding()
                    }
                })
                .foregroundStyle(.black)
                .contextMenu(ContextMenu(menuItems: {
                    Text("Menu Item 1")
                    Text("Menu Item 2")
                    Text("Menu Item 3")
                }))
            }
            
            HStack {
                
                ForEach(typeDresses, id: \.self) { item in
                    HStack {
                        Button(action: {
                            self.dressSelected = item
                        }, label: {
                            Text(item).font(.system(size: 8, weight: .semibold, design: .default))
                                .padding()
                        })
                        .foregroundStyle(self.dressSelected == item ? .white : .black)
                        .background(self.dressSelected == item ? .black : .clear)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                
            }
            
            DetailLazyVGridScrollView()
        }
        .padding()
        .background(Color.white)
    }
}

struct DetailLazyVGridScrollView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            ForEach(customData) { itemCustomData in
                
                LazyVGrid(columns: Array(repeating: GridItem(), count: 2), content: {
                    
                    ForEach(itemCustomData.myRows) { itemRow in
                        
                        NavigationLink(destination: DetailFashionContentView(model: itemRow)) {
                            CardCarrousel(model: itemRow)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                    }
                    
                    
                })
            }
            
        }
    }
}


struct CardCarrousel: View {
    
    var model: Row
    
    var body: some View {
        VStack(spacing: 20) {
            Image(model.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            HStack {
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(model.name)
                        .font(.headline)
                    Text(model.price)
                        .fontWeight(.black)
                }
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Image("option").renderingMode(.original).foregroundStyle(.black)
                })
                .padding(.trailing, 15)
            }
            
            
        }
    }
}




//#Preview {
//    CustomMainView()
//}

//MARK: - Models Data
struct CustomType: Identifiable {
    var id: Int
    var myRows: [Row]
}

struct Row: Identifiable{
    var id: Int
    var name: String
    var image: String
    var price: String
}

var sizes = ["S", "M", "L", "XL"]
var typeDresses = ["Dress", "Pants", "Blazers", "Jackets"]
var customData = [CustomType(id: 0, myRows: [Row(id: 0,
                                                 name: "Fit and Flare",
                                                 image: "p1",
                                                 price: "€199"),
                                             Row(id: 1,
                                                 name: "Fit and Summer",
                                                 image: "p21",
                                                 price: "€399"),
                                             Row(id: 2,
                                                 name: "Empire and Flare",
                                                 image: "p12",
                                                 price: "€299"),
                                             Row(id: 3,
                                                 name: "Fit and Vibes",
                                                 image: "p22",
                                                 price: "€39"),
                                             Row(id: 4,
                                                 name: "Empire and Vibe",
                                                 image: "p1",
                                                 price: "€99"),
                                             Row(id: 5,
                                                 name: "Fit and Empire",
                                                 image: "p12",
                                                 price: "€399")])]
