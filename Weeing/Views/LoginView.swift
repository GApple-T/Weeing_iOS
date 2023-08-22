//
//  LoginView.swift
//  Weeing
//
//  Created by 이승화 on 2023/08/22.
//

import SwiftUI

struct LoginView: View {
    
    @State private var emailText = ""
    @State private var passwordText = ""
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            VStack {
                Text("Login")
                    .foregroundColor(.loginColor)
                    .font(.custom("Nunito-Black",size: 45))
                    .padding(.horizontal,134)
                    .padding(.top,109)
                Group {
                    Text("Email")
                        .foregroundColor(.loginLetterColor)
                        .font(.custom("AppleSDGothicNeoM00", size:16))
                        .padding(.top,65)
                        .padding(.trailing,287)
                        .padding(.leading,56)

                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.loginTextFieldColor)
                        .frame(height:40)
                        .padding(.horizontal,50)
                        .overlay(
                            ZStack {
                                TextField("",text: $emailText)
                                    .padding(.leading,60)
                                    .padding(.trailing,130)
                                
                                Text("@gsm.hs.kr")
                                    .font(.custom("AppleSDGothicNeoM00", size: 14))
                                    .foregroundColor(.grayColor)
                                    .padding(.leading,210)
                            }
                        )
                }
                
                Group {
                    Text("Password")
                        .foregroundColor(.loginLetterColor)
                        .font(.custom("AppleSDGothicNeoM00", size:16))
                        .padding(.top,12)
                        .padding(.trailing,257)
                        .padding(.leading,55)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.loginTextFieldColor)
                        .frame(height:40)
                        .padding(.horizontal,50)
                        .overlay(
                            ZStack {
                                TextField("",text: $passwordText)
                                    .padding(.leading,60)
                                    .padding(.trailing,130)
                                
                                Image(systemName: "eye")
                                    .resizable()
                                    .frame(width:15,height: 10)
                                    .foregroundColor(.grayColor)
                                    .padding(.leading,250)
                            }
                        )
                    
                    Text("Forgot Password?")
                        .foregroundColor(.grayColor)
                        .font(.custom("AppleSDGothicNeoM00", size: 12))
                        .padding(.leading,56)
                        .padding(.trailing,244)
                }
                
                Rectangle()
                    .foregroundColor(.loginColor)
                    .frame(height:40)
                    .cornerRadius(10)
                    .overlay(
                        Text("로그인")
                            .foregroundColor(.white)
                            .font(.custom("AppleSDGothicNeoM00", size: 15))
                    )
                    .padding(.horizontal,50)
                    .padding(.top,38)
                    
                Spacer()
                
                Text("아직 계정이 없으신가요?")
                    .foregroundColor(.grayColor)
                    .font(.custom("Apple", size: 12))
                    .padding(.bottom,44)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
