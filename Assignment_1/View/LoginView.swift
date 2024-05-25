//
//  LoginView.swift
//  Assignment_1
//
//  Created by Anshumali Karna on 24/05/24.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String = ""
    @State private var showError: Bool = false
    @State private var loadingAnimation: Bool = false
    @AppStorage("auth")  var isAuthentication: Bool = false
    var body: some View {
        VStack(spacing: 20) {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.4)
            
            
            VStack(alignment: .leading, spacing: 15) {
                Text("Email")
                    .font(.headline)
                CustomTextField(text: $email, placeholder: "example@mail.com")
                
                Text("Password")
                    .font(.headline)
                CustomTextField(text: $password, placeholder: "********", isSecure: true)
            }
            .padding(.horizontal, 40)
            
            if loadingAnimation {
                LoadingHelixView()
            }
            else {
                Button(action: {
                    // Handle login action
                    if isValidEmail(email: email){
                        if password != "" {
                            self.loadingAnimation = true
                            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                                if let error = error {
                                    // Handle error
                                    self.showError = true
                                    self.errorMessage = error.localizedDescription
                                    return
                                }
                                
                                // Successfully created a user
                                if let user = authResult?.user {
                                    // You can perform additional actions with the user object if needed
                                    print("User Signed In: \(user.uid)")
                                    self.errorMessage = "User Created Successfully"
                                    self.isAuthentication = true
                                    self.loadingAnimation = false
                                }
                                
                                
                            }
                
                        } else {
                            self.showError.toggle()
                            self.errorMessage = "Please Enter Your Password"
                        }
                    } else {
                        self.showError.toggle()
                        self.errorMessage = "Invalid Email"
                    }
                }) {
                    Text("Login")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(AnimatedButtonStyle())
                .padding(.horizontal, 10)
                .padding(.top, 20)
                
            }
            NavigationLink {
                SignUpView()
            }
        label:  {
            Text("Not a user? Sign Up Here")
                .font(.footnote)
                .foregroundColor(.blue)
        }
            
            Spacer()
            
            Text("Thanks for choosing Us! ❤️")
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .padding()
        .alert(errorMessage, isPresented: $showError) {
            
        }
    }
}

#Preview {
    LoginView()
}
