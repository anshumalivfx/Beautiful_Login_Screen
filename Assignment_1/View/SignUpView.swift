//
//  SignUpView.swift
//  Assignment_1
//
//  Created by Anshumali Karna on 25/05/24.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showError: Bool = false
    @State private var errorMessage: String = ""
    @State private var loadingAnimation: Bool = false
    @AppStorage("auth")  var isAuthentication: Bool = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 15) {
                Text("Email")
                    .font(.headline)
                CustomTextField(text: $email, placeholder: "example@mail.com")
                
                Text("Password")
                    .font(.headline)
                CustomTextField(text: $password, placeholder: "********", isSecure: true)
                
                Text("Confirm Password")
                    .font(.headline)
                CustomTextField(text: $confirmPassword, placeholder: "********", isSecure: true)
            }
            .padding(.horizontal, 40)
            
            if loadingAnimation {
                LoadingHelixView()
            } else {
                
                Button(action: {
                    // Handle login action
                    if isValidEmail(email: email){
                        if password == confirmPassword {
                            self.loadingAnimation = true
                            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                                if let error = error {
                                    // Handle error
                                    self.showError = true
                                    self.errorMessage = error.localizedDescription
                                    return
                                }
                                
                                // Successfully created a user
                                if let user = authResult?.user {
                                    // You can perform additional actions with the user object if needed
                                    print("User created: \(user.uid)")
                                    self.errorMessage = "User Created Successfully"
                                    self.showError.toggle()
                                    self.loadingAnimation = false
                                    self.dismiss()
                                }
                            }
                        }
                        else {
                            errorMessage = "Confirm Password Doesn't Match"
                            showError.toggle()
                        }
                    }
                    
                    else {
                        errorMessage = "Invalid Email"
                        showError.toggle()
                        
                    }
                }) {
                    Text("SignUp")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(AnimatedButtonStyle())
                .padding(.horizontal, 30)
                .padding(.top, 20)
                
            }
            
            
            
        }
        .alert(errorMessage, isPresented: $showError) {
            
        }
    }
}
#Preview {
    SignUpView()
}
