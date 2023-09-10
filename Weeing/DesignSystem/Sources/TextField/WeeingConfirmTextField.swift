//
//  WeeingConfirmTextField.swift
//  Weeing
//
//  Created by 이승화 on 2023/09/01.
//

import SwiftUI

public struct WeeingConfirmTextField: View {
    @Binding var textFieldText: String
    var textFieldColor: Color
    var titleColor: Color
    
    public init(
        textFieldText: Binding<String>,
        textFieldColor: Color,
        titleColor: Color
    ) {
        self._textFieldText = textFieldText
        self.textFieldColor = textFieldColor
        self.titleColor = titleColor
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            Text("인증번호")
                .foregroundColor(titleColor)
                .font(.custom("AppleSDGothicNeoM00", size:15))
                .padding(.top,12)
                .padding(.trailing,282)
                .padding(.leading,56)
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(textFieldColor)
                .frame(height:40)
                .padding(.horizontal,50)
                .padding(.top,7)
                .overlay(
                    TextField("인증번호를 입력해주세요.",text: $textFieldText)
                        .font(.system(size:12))
                        .padding(.leading,60)
                        .padding(.trailing,130)
                        .padding(.top,10)
                )
        }
    }
}
