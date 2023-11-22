//
//  ResetPasswordView.swift
//  Weeing
//
//  Created by 이승화 on 2023/08/24.
//

import SwiftUI

enum ResetPassword: Hashable {
    case password
    case checkPassword
}

struct ResetPasswordView: View {
    @State private var showPassword = false
    @State private var passwordText = ""
    @State private var checkPasswordText = ""
    @FocusState private var focusField: ResetPassword?

    var body: some View {
        ZStack {
            Color.BG.ignoresSafeArea()
            VStack(spacing: 0) {
                Text("Reset Password")
                    .font(.custom("Nunito-Black", size: 35))
                    .foregroundColor(.S40)
                    .padding(.top, 109)

                WeeingPasswordTextField(
                    textFieldText: $passwordText,
                    isSecure: $showPassword,
                    titleColor: .S40,
                    helpMessage: "비밀번호는 8~24자 사이여야되며, 특수문자를 포함해야합니다."
                )
                .padding(.top, 78)
                .focused($focusField, equals: .password)
                .onSubmit {
                    focusField = .checkPassword
                }

                WeeingCheckPasswordTextField(
                    titleColor: .S40,
                    textFieldText: $checkPasswordText
                )
                .padding(.top, 16)
                .submitLabel(.done)

                StartPageButton(buttonText: "완료", buttonColor: .SO4080)
                    .padding(.top, 37)

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
