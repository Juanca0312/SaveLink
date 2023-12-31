//
//  ContentView.swift
//  SaveLink
//
//  Created by Juan Carlos Hernandez Castillo on 6/10/23.
//

import SwiftUI

enum AuthenticationSheetView: String, Identifiable {
    case register
    case login
    
    var id: String {
        return rawValue
    }
}

struct AuthenticationView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State private var authenticationSheetView: AuthenticationSheetView?
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .resizable()
                .frame(width: 200, height: 200)
            VStack {
                Button {
                    authenticationSheetView = .login
                } label: {
                    Label("Entra con Email", systemImage: "envelope.fill")
                }
                .tint(.black)
                
                Button {
                    authenticationViewModel.loginFacebook()
                } label: {
                    Label("Entra con Facebook", systemImage: "envelope.fill")
                }
                .tint(.blue)
            }
            .controlSize(.large)
            .buttonStyle(.bordered)
            .padding(.top, 60)
            
            Spacer()
            
            HStack {
                Button {
                    authenticationSheetView = .register
                } label: {
                    Text("No tienes cuenta?")
                    Text("Regístrate")
                        .underline()
                }
                .tint(.black)
            }
            
        }
        .padding()
        .sheet(item: $authenticationSheetView) { sheet in
            switch sheet {
            case .login:
                LoginEmailView(authenticationViewModel: authenticationViewModel)
            case .register:
                RegisterEmailView(authenticationViewModel: authenticationViewModel)
            }
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView(authenticationViewModel: AuthenticationViewModel())
    }
}
