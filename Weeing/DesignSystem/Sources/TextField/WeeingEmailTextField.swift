//
//  WeeingTextField.swift
//  Weeing
//
//  Created by 이승화 on 2023/08/30.
//

import SwiftUI

public struct WeeingEmailTextField: View {
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
            Text("Email")
                .foregroundColor(titleColor)
                .font(.custom("AppleSDGothicNeoM00", size:16))
                .padding(.trailing,298)
                .padding(.leading,52)
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(textFieldColor)
                .frame(height:40)
                .padding(.horizontal,45)
                .padding(.top,6)
                .overlay(
                    ZStack {
                        TextField("",text: $textFieldText)
                            .padding(.leading,55)
                            .padding(.trailing,130)
                        
                        Text("@gsm.hs.kr")
                            .font(.custom("AppleSDGothicNeoM00", size: 14))
                            .foregroundColor(.N20)
                            .padding(.leading,218)
                    }
                )
        }
    }
}
