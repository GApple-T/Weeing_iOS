//
//  FIndPasswordView.swift
//  Weeing
//
//  Created by 이승화 on 2023/08/23.
//

import SwiftUI

enum FindPassword: Hashable {
    case email
    case confirmNumber
}

struct FIndPasswordView: View {
    @State private var textEmail = ""
    @State private var confirmNumber = ""
    @State private var pressedConfirm = false
    @Environment(\.dismiss) var dismiss
    @FocusState private var focusField: FindPassword?

    var backButton: some View {
        Button {
            self.dismiss()
        } label: {
            HStack {
                Image(systemName: "chevron.left")
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.SO4080)
            }
        }
    }

    var body: some View {
        NavigationView {
            ZStack {
                Color.BG.ignoresSafeArea()
                VStack(spacing: 0) {
                    Text("Find Password")
                        .font(.custom("Nunito-Black", size: 35))
                        .foregroundColor(Color.S40)
                        .padding(.top, 66)
                        .padding(.horizontal, 70)

                    WeeingEmailTextField(
                        textFieldText: $textEmail,
                        titleColor: .S40,
                        helpMessage: pressedConfirm ? "" : "회원가입 시 사용하신 이메일을 입력해주세요."
                    )
                    .padding(.top, 78)
                    .focused($focusField, equals: .email)
                    .onSubmit {
                        focusField = .confirmNumber
                        pressedConfirm = true
                    }

                    if pressedConfirm == true {
                        WeeingConfirmTextField(
                            textFieldText: $confirmNumber,
                            titleColor: .S40
                        )
                        .focused($focusField, equals: .confirmNumber)
                        .submitLabel(.done)
                        .padding(.top, 5)
                    }

                    Button {
                        self.pressedConfirm.toggle()
                    } label: {
                        StartPageButton(buttonText: pressedConfirm ? "완료" : "확인", buttonColor: .SO4080)
                            .padding(.top, 44)
                    }

                    Spacer()

                    Text(pressedConfirm ? "인증번호가 발송되지 않았나요?" : "")
                        .foregroundColor(Color.N20)
                        .font(.custom("AppleSDGothicNeoM00", size: 12))
                        .padding(.bottom, 44)
                }
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: backButton)
    }
}

struct FIndPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        FIndPasswordView()
    }
}