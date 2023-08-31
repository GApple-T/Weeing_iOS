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
                
                Text("Password")
                    .font(.custom("AppleSDGothicNeoM00", size: 16))
                    .foregroundColor(.findPasswordColor)
                    .padding(.top,40)
                    .padding(.leading,58)
                    .padding(.trailing,263)
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.findPasswordTextFieldColor)
                    .frame(height:40)
                    .padding(.horizontal,50)
                    .overlay(
                        HStack {
                            if showPassword == false {
                                SecureField("",text: $passwordText)
                                    .font(.system(size:12))
                                    .padding(.leading,60)
                                    .padding(.trailing,130)
                            } else {
                                TextField("",text: $passwordText)
                                    .font(.system(size:12))
                                    .padding(.leading,60)
                                    .padding(.trailing,130)
                            }
                            
                            Button {
                                self.showPassword.toggle()
                            } label: {
                                if showPassword == false {
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
                
                Text("비밀번호는 8~16자 사이여야되며, 특수문자를 포함해야합니다.")
                    .font(.custom("AppleSDGothicNeoM00", size: 9))
                    .foregroundColor(.grayColor)
                    .padding(.leading,58)
                    .padding(.trailing,112)
                
                Text("Check Password")
                    .font(.custom("AppleSDGothicNeoM00", size: 15))
                    .foregroundColor(.findPasswordColor)
                    .padding(.top,12)
                    .padding(.leading,58)
                    .padding(.trailing,223)
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.findPasswordTextFieldColor)
                    .frame(height:40)
                    .padding(.horizontal,50)
                    .overlay(
                        HStack {
                            SecureField("", text: $checkPasswordText)
                                .padding(.leading,60)
                                .padding(.trailing,60)
                        })
                
                Rectangle()
                    .foregroundColor(.findPasswordButtonColor)
                    .frame(height:40)
                    .cornerRadius(10)
                    .overlay(
                        Text("완료")
                            .font(.custom("AppleSDGothicNeoM00", size: 15))
                            .foregroundColor(.white)
                    )
                    .padding(.horizontal,50)
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
