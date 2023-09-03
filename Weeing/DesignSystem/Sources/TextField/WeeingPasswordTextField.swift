//
//  WeeingPasswordTextField.swift
//  Weeing
//
//  Created by 이승화 on 2023/09/01.
//

import SwiftUI

public struct WeeingPasswordTextField: View {
    @Binding var textFieldText: String
    @Binding var pressedEye: Bool
    var textFieldColor: Color
    var titleColor: Color
    
    public init(
        textFieldText: Binding<String>,
        pressedEye: Binding<Bool>,
        textFieldColor: Color,
        titleColor: Color
    ) {
        self._textFieldText = textFieldText
        self._pressedEye = pressedEye
        self.textFieldColor = textFieldColor
        self.titleColor = titleColor
    }
    public var body: some View {
        VStack {
            Text("Password")
                .foregroundColor(titleColor)
                .font(.custom("AppleSDGothicNeoM00", size:16))
                .padding(.trailing,263)
                .padding(.leading,58)
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(textFieldColor)
                .frame(height:40)
                .padding(.horizontal,50)
                .overlay(
                    HStack {
                        if pressedEye == false {
                            SecureField("",text: $textFieldText)
                                .font(.system(size:12))
                                .padding(.leading,60)
                                .padding(.trailing,48)
                        } else {
                            TextField("",text: $textFieldText)
                                .font(.system(size:12))
                                .padding(.leading,60)
                                .padding(.trailing,48)
                        }
                        
                        Button {
                            self.pressedEye.toggle()
                        } label: {
                            if pressedEye == false {
                                Image(systemName: "eye")
                                    .resizable()
                                    .frame(width:15,height: 10)
                                    .foregroundColor(.grayColor)
                                    .padding(.trailing,62)
                            } else {
                                Image(systemName: "eye.slash")
                                    .resizable()
                                    .frame(width:15,height: 10)
                                    .foregroundColor(.grayColor)
                                    .padding(.trailing,62)
                            }
                        }
                        
                    }
                    
                )
        }
    }
}
