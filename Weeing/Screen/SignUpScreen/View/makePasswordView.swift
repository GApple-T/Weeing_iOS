//
//  makePasswordView.swift
//  Weeing
//
//  Created by 이승화 on 2023/08/23.
//

import SwiftUI

enum checkPassword: Hashable {
    case password
    case checkPassword
}

struct makePasswordView: View {
    @State private var passwordText = ""
    @State private var checkPasswordText = ""
    @State private var showPassword = false
    @FocusState private var focusField: checkPassword?

    var body: some View {
        ZStack {
            Color.BG.ignoresSafeArea()
            VStack(spacing: 0) {
                Text("Sign Up")
                    .font(.custom("Nunito-Black", size: 44))
                    .foregroundColor(.S30)
                    .padding(.horizontal, 112)
                    .padding(.top, 109)

                WeeingPasswordTextField(textFieldText: $passwordText, pressedEye: $showPassword, textFieldColor: .SO3020, titleColor: .S30)
                    .padding(.top, 66)
                    .focused($focusField, equals: .password)
                    .onSubmit {
                        focusField = .checkPassword
                    }

                Text("비밀번호는 8~16자 사이여야되며, 특수문자를 포함해야합니다.")
                    .font(.custom("AppleSDGothicNeoM00", size: 10))
                    .foregroundColor(.N20)
                    .padding(.top, 4)
                    .padding(.leading, 52)
                    .padding(.trailing, 92)

                WeeingCheckPasswordTextField(titleColor: .S30, textFieldColor: .SO3020, textFieldText: $checkPasswordText)
                    .padding(.top, 16)
                    .focused($focusField, equals: .checkPassword)
                    .submitLabel(.done)

                startPageButton(buttonText: "회원가입", buttonColor: .S30)
                    .padding(.top, 36)

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
