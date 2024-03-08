//
//  MainView.swift
//  NTTMovies
//
//  Created by Guillermo Rodríguez ALonso on 7/3/24.
//

import SwiftUI

struct MainView: View {
    //MARK: - ViewController
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 20) {
                
                HeaderComponent()
                
                Group{
                    
                    Button("Botón con sombra") {
                        //
                    }
                    .padding()
                    .font(.title)
                    .foregroundStyle(Color.black)
                    .background(Color.orange)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 10)
                    
                    
                    Button("Botón con sombra") {
                        //
                    }
                    .padding()
                    .font(.title)
                    .foregroundStyle(Color.black)
                    .background(Color.orange)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 10)
                    
                    
                    Button("Botón con sombra") {
                        //
                    }
                    .padding()
                    .font(.title)
                    .foregroundStyle(Color.black)
                    .background(Color.orange)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 10)
                    
                    
                    Button("Botón con sombra") {
                        //
                    }
                    .padding()
                    .font(.title)
                    .foregroundStyle(Color.black)
                    .background(Color.orange)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 10)
                    
                }
            }
        }
    }
}

struct RefactoringView: View {
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){
            
            VStack(spacing: 20) {
                
                HeaderComponent()
                Image(systemName: "hand.thumbsup.fill")
                    .font(.system(size: 50))
                
                Image("CapturaDos")
                    .aspectRatio(contentMode: .fit)
                    .padding(3)
                    .overlay (
                        Text("SwiftUI")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(Color.red), alignment: .topTrailing
                    )
                    .blur(radius: 1)
            }
            
        }
    }
}

struct Shapes: View {
    var body: some View {
        VStack {
            
            HeaderComponent()
            
            Text("Se puede meter shapes para decorar vistas")
                .padding(12)
                .foregroundStyle(.white)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(.black)
                )
                .padding(4)
            
            Text("Se puede ajustar el fondo pero no con un Shape")
                .padding(12)
                .foregroundStyle(.white)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(4)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
        }
        
        
    }
}

struct HorizontalStackView: View {
    var body: some View {
        
        VStack{
            HeaderComponent()
            
            HStack {
                Text("Leading")
                Text("center")
                Text("trealing")
            }
            .padding()
            .border(Color.black)
            
            
            HStack {
                Image(systemName: "1.circle")
                    .foregroundStyle(.yellow)
                Image(systemName: "2.circle")
                    .foregroundStyle(.blue)
                Image(systemName: "3.circle")
                    .foregroundStyle(.red)
            }
            .padding()
            .font(.largeTitle)
            
            HStack {
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 100) {
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "a.circle.fill")
                                .foregroundStyle(.red)
                        })
                        Image(systemName: "b.circle.fill")
                            .foregroundStyle(.red)
                        Image(systemName: "c.circle.fill")
                            .foregroundStyle(.red)
                        Image(systemName: "d.circle.fill")
                            .foregroundStyle(.red)
                        Image(systemName: "e.circle.fill")
                            .foregroundStyle(.red)
                    }
                    .padding(20)
                }
                .font(.largeTitle)
                .background(.yellow)
            }
            
        }
        
    }
}

struct ZStackView: View {
    var body: some View {
        
        ZStack {
            VStack(spacing: 20) {
                Spacer()
                HeaderComponent()
                Spacer()
            }
        }
        .background(.gray)
        .ignoresSafeArea(.all)
        
    }
}

#Preview {
    //MainView()
    //RefactoringView()
    //Shapes()
    //HorizontalStackView()
    ZStackView()
}
