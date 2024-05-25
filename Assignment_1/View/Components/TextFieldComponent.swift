//
//  TextFieldComponent.swift
//  Assignment_1
//
//  Created by Anshumali Karna on 25/05/24.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    @FocusState private var isFocused: Bool
    
    var placeholder: String
    var isSecure: Bool = false
    
    var body: some View {
        Group {
            if isSecure {
                SecureField(placeholder, text: $text)
                    .focused($isFocused)
            } else {
                TextField(placeholder, text: $text)
                    .focused($isFocused)
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).stroke(isFocused ? Color.purple : Color.gray.opacity(0.25), lineWidth: 2))
        .frame(width: UIScreen.main.bounds.width * 0.85,height: 50)
        .animation(.easeInOut, value: isFocused)
    }
}
