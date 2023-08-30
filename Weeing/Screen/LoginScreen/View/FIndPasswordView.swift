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
                    
                    Text("Email")
                        .font(.custom("AppleSDGothicNeoM00", size: 16))
                        .foregroundColor(.findPasswordColor)
                        .padding(.top,pressedConfirm ? 65 : 113)
                        .padding(.leading,54)
                        .padding(.trailing,297)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.findPasswordTextFieldColor)
                        .frame(height:40)
                        .padding(.horizontal,50)
                        .overlay(
                            ZStack {
                                Text("@gsm.hs.kr")
                                    .font(.custom("AppleSDGothicNeoM00", size: 14))
                                    .foregroundColor(.grayColor)
                                    .padding(.leading,210)
                                
                                TextField("",text: $textEmail)
                                    .font(.system(size:12))
                                    .padding(.leading,60)
                                    .padding(.trailing,130)
                            }
                        )
                    
                    if pressedConfirm == false {
                        Text("회원가입 시 사용하신 이메일을 입력해주세요.")
                            .foregroundColor(.grayColor)
                            .font(.custom("AppleSDGothicNeoM00", size: 10))
                            .padding(.leading,58)
                            .padding(.trailing,154)
                    }
                    
                    if pressedConfirm == true {
                        Text("인증번호")
                            .font(.custom("AppleSDGothicNeoM00", size: 15))
                            .foregroundColor(.findPasswordColor)
                            .padding(.top,12)
                            .padding(.leading,56)
                            .padding(.trailing,282)
                        
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.findPasswordTextFieldColor)
                            .frame(height:40)
                            .padding(.horizontal,50)
                            .overlay(
                                TextField("인증번호를 입력해주세요.",text: $textEmail)
                                    .font(.system(size:12))
                                    .padding(.leading,60)
                                    .padding(.trailing,130)
                            )
                    }
                    
                    Button {
                        self.pressedConfirm.toggle()
                    } label: {
                        Rectangle()
                            .foregroundColor(.findPasswordButtonColor)
                            .frame(height:40)
                            .cornerRadius(10)
                            .overlay(
                                Text(pressedConfirm ? "완료" : "확인")
                                    .font(.custom("AppleSDGothicNeoM00", size: 15))
                                    .foregroundColor(.white)
                            )
                            .padding(.horizontal,50)
                            .padding(.top,34)
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
