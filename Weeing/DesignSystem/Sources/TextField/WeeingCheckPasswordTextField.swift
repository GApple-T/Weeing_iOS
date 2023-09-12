//
//  WeeingCheckPasswordTextField.swift
//  Weeing
//
//  Created by 이승화 on 2023/09/02.
//

import SwiftUI

public struct WeeingCheckPasswordTextField: View {
    @State private var titleColor: Color
    @State private var textFieldColor: Color
    @Binding var textFieldText: String
    
    public init(
        titleColor: Color,
        textFieldColor: Color,
        textFieldText: Binding<String>
    ) {
        self._textFieldText = textFieldText
        self.titleColor = titleColor
        self.textFieldColor = textFieldColor
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            Text("Check Password")
                .font(.custom("AppleSDGothicNeoM00", size: 15))
                .foregroundColor(titleColor)
                .padding(.leading,52)
                .padding(.trailing,226)
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(textFieldColor)
                .frame(height:40)
                .padding(.horizontal,45)
                .padding(.top,6)
                .overlay(
                    HStack {
                        SecureField("", text: $textFieldText)
                            .padding(.leading,55)
                            .padding(.trailing,60)
                    })
        }
    }
}
