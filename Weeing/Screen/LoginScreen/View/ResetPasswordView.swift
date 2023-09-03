//
//  ResetPasswordView.swift
//  Weeing
//
//  Created by 이승화 on 2023/08/24.
//

import SwiftUI

struct ResetPasswordView: View {
    
    @State private var showPassword = false
    @State private var passwordText = ""
    @State private var checkPasswordText = ""
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            VStack {
                Text("Reset Password")
                    .font(.custom("Nunito-Black", size: 35))
                    .foregroundColor(.findPasswordColor)
                    .padding(.top,109)
                
                WeeingPasswordTextField(textFieldText: $passwordText, pressedEye: $showPassword, textFieldColor: .findPasswordTextFieldColor, titleColor: .findPasswordColor)
                    .padding(.top,53)
                
                Text("비밀번호는 8~16자 사이여야되며, 특수문자를 포함해야합니다.")
                    .font(.custom("AppleSDGothicNeoM00", size: 9))
                    .foregroundColor(.grayColor)
                    .padding(.leading,58)
                    .padding(.trailing,112)
                
                WeeingCheckPasswordTextField(titleColor: .findPasswordColor, textFieldColor: .findPasswordTextFieldColor, textFieldText: $checkPasswordText)
                    .padding(.top,12)
                
                startPageButton(buttonText: "완료", buttonColor: .findPasswordButtonColor)
                    .padding(.top,48)
                
                Spacer()
            }
        }
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
