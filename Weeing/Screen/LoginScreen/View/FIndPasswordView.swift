//
//  FIndPasswordView.swift
//  Weeing
//
//  Created by 이승화 on 2023/08/23.
//

import SwiftUI

struct FIndPasswordView: View {
    
    @State private var textEmail = ""
    @State private var confirmNumber = ""
    @State private var pressedConfirm = false
    @Environment(\.dismiss) var dismiss
    
    var backButton : some View {
        Button {
            self.dismiss()
        } label: {
            HStack {
                Image(systemName: "chevron.left")
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.findPasswordColor)
            }
        }

    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundColor.ignoresSafeArea()
                VStack {
                    Text("Find Password")
                        .font(.custom("Nunito-Black", size: 35))
                        .foregroundColor(.findPasswordColor)
                        .padding(.top,66)
                        .padding(.horizontal,70)
                    
                    WeeingEmailTextField(textFieldText: $textEmail, textFieldColor: .findPasswordTextFieldColor, titleColor: .findPasswordColor)
                        .padding(.top,pressedConfirm ? 65 : 113)
                    
                    if pressedConfirm == false {
                        Text("회원가입 시 사용하신 이메일을 입력해주세요.")
                            .foregroundColor(.grayColor)
                            .font(.custom("AppleSDGothicNeoM00", size: 10))
                            .padding(.leading,58)
                            .padding(.trailing,154)
                    }
                    
                    if pressedConfirm == true {
                        WeeingConfirmTextField(textFieldText: $confirmNumber, textFieldColor: .findPasswordTextFieldColor, titleColor: .findPasswordColor)
                    }
                    
                    Button {
                        self.pressedConfirm.toggle()
                    } label: {
                        startPageButton(buttonText: pressedConfirm ? "완료" : "확인", buttonColor: .findPasswordColor)
                            .padding(.top, 34)
                    }
                    
                    Spacer()
                    
                    Text(pressedConfirm ? "인증번호가 발송되지 않았나요?" : "")
                        .foregroundColor(.grayColor)
                        .font(.custom("AppleSDGothicNeoM00", size: 12))
                        .padding(.bottom,44)
                    
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}

struct FIndPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        FIndPasswordView()
    }
}
