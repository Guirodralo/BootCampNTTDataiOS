//
//  ControlFlujo.swift
//  NTTMovies
//
//  Created by Guillermo Rodríguez ALonso on 7/3/24.
//

import SwiftUI

struct ControlFlujo: View {
    
    @State private var showActionSheet = false
    @State private var showAlert = false
    @State private var showCustomPopUp = false
    @State private var showNextView = false
    
    var body: some View {
        NavigationStack {
            ZStack {
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
                                self.showNextView.toggle()
                            }), .default(Text("Boton 2"), action: {
                                //Esta es la accion del boton 2
                            }), .cancel({
                                //Accion de cancelar
                            })])
                        })
                        .navigationDestination(isPresented: self.$showNextView) {
                            MainView()
                        }
                        
                        CustomButtonView(showAlert: self.$showAlert)
                            .alert(isPresented: self.$showAlert, content: {
                                Alert(title: Text("Tipo alerta"), message: Text("Este es el mensaje de la alerta"), primaryButton: .default(Text("OK"), action: {
                                    //Accion del boton OK
                                }), secondaryButton: .cancel({
                                    //Accion del boton Cancelar
                                }))
                            })
                        
                        
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                self.showCustomPopUp.toggle()
                            }
                        }) {
                            HStack {
                                Image(systemName: "play")
                                Text("Muestra un CustomPopUp")
                            }
                            .padding()
                            .font(.title)
                            .foregroundStyle(.black)
                            .background(.green)
                        }
                        
                    }
                }
                .blur(radius: self.showCustomPopUp ? 10 : 0)
                
                if showCustomPopUp {
                    CustomPopUpView(title: "Custom PopUp", message: "Esto es un CustomPopUp que se pintará encima de la vista padre y hará un efecto blur y pondrá el fondo medio opaco. Esto es un CustomPopUp que se pintará encima de la vista padre y hará un efecto blur y pondrá el fondo medio opaco. Esto es un CustomPopUp que se pintará encima de la vista padre y hará un efecto blur y pondrá el fondo medio opaco.", hideCustomPopup: self.$showCustomPopUp)
                    
                }
                
            }
        }
    }
}

struct CustomButtonView: View {
    
    @Binding var showAlert: Bool
    
    var body: some View {
        Button(action: {
            self.showAlert.toggle()
        } ) {
            HStack {
                Image(systemName: "play")
                Text("Muestra un ActionSheet")
            }
            .font(.title)
            .foregroundStyle(.black)
        }
        .padding()
        .background(.orange)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 10)
    }
}




struct CustomPopUpView: View {
    
    var title: String
    var message: String
    
    @Binding var hideCustomPopup: Bool
    
    var body: some View {
        
        ZStack{
            
            Color.black.opacity(0.4).ignoresSafeArea(edges: .all)
            VStack(spacing: 20) {
                
                HStack {
                    
                    Spacer()
                    
                    Text(title)
                        .bold()
                        .foregroundStyle(.black)
                        .multilineTextAlignment(.center)
                    
                    
                    Spacer()
                    
                    Button(action: {
                        self.hideCustomPopup = false
                    }) {
                        Image(systemName: "xmark")
                    }
                }
                
                
                Divider()
                
                Text(message)
                    .font(.custom("Arial", size: 14))
                
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width * 0.90)
            .background(Color.white)
            .foregroundStyle(.black)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 10)
            
        }
        
    }
}

#Preview {
    ControlFlujo()
    //    CustomPopUpView(title: "Custom PopUp", message: "Esto es un CustomPopUp que se pintara encima de la vista padre y hara un efecto blur y pondra el fondo medio opaco Esto es un CustomPopUp que se pintara encima de la vista padre y hara un efecto blur y pondra el fondo medio opaco Esto es un CustomPopUp que se pintara encima de la vista padre y hara un efecto blur y pondra el fondo medio opaco", hideCustomPopup: .constant(true))
}

