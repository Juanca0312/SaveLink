//
//  LoginEmailView.swift
//  SaveLink
//
//  Created by Juan Carlos Hernandez Castillo on 7/10/23.
//

import SwiftUI

struct LoginEmailView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    
    @State var textFieldEmail: String = ""
    @State var textFieldPassword: String = ""
    
    
    var body: some View {
        VStack {
            DismissView()
            Group {
                Text("Bienvenido de nuevo a")
                Text("Juanca apps")
                    .bold()
                    .underline()
            }
            .padding(.horizontal, 8)
            .multilineTextAlignment(.center)
            .font(.largeTitle)
            .tint(.primary)
            
            Group {
                Text("Loggeate nuevamente para acceder a tus links")
                    .tint(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.top, 2)
                    .padding(.bottom, 2)
                TextField("Añade tu email", text: $textFieldEmail)
                TextField("Añade tu password", text: $textFieldPassword)
                Button ("Login") {
                    authenticationViewModel.login(email: textFieldEmail, password: textFieldPassword)
                }
                .padding(.top, 18)
                .buttonStyle(.bordered)
                .tint(.blue)
                if let messageError = authenticationViewModel.messageError {
                    Text(messageError)
                        .bold()
                        .font(.body)
                        .foregroundColor(.red)
                        .padding(.top, 20)
                }
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal, 64)
            
            Spacer()
        }
        .padding(.vertical)
    }
}

struct LoginEmailView_Previews: PreviewProvider {
    static var previews: some View {
        LoginEmailView(authenticationViewModel: AuthenticationViewModel())
    }
}
