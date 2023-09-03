//
//  makePasswordView.swift
//  Weeing
//
//  Created by 이승화 on 2023/08/23.
//

import SwiftUI

struct makePasswordView: View {
    
    @State private var passwordText = ""
    @State private var checkPasswordText = ""
    @State private var showPassword = false
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            VStack {
                Text("Sign Up")
                    .font(.custom("Nunito-Black", size: 44))
                    .foregroundColor(.joinColor)
                    .padding(.horizontal,112)
                    .padding(.top,115)
                
                WeeingPasswordTextField(textFieldText: $passwordText, pressedEye: $showPassword, textFieldColor: .joinTextFieldColor, titleColor: .joinColor)
                    .padding(.top,66)
                
                    Text("비밀번호는 8~16자 사이여야되며, 특수문자를 포함해야합니다.")
                        .font(.custom("AppleSDGothicNeoM00", size: 9))
                        .foregroundColor(.grayColor)
                        .padding(.leading,58)
                        .padding(.trailing,112)
                
                WeeingCheckPasswordTextField(titleColor: .joinColor, textFieldColor: .joinTextFieldColor, textFieldText: $checkPasswordText)
                    .padding(.top,12)
                
                startPageButton(buttonText: "회원가입", buttonColor: .joinColor)
                        .padding(.top,48)

                Spacer()
                
            }
        }
    }
}


struct makePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        makePasswordView()
    }
}
