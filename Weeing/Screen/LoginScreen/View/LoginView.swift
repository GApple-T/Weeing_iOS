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
    @State private var showPassword = false
    @State private var showLoginView = false
    let emailPattern = "^S([21-23]{2})0([01-72]{2})$"
    
    var body: some View {
        ZStack {
            if showLoginView {
                NavigationView {
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
                                    .foregroundColor(Color.loginLetterColor)
                                    .font(.custom("AppleSDGothicNeoM00", size:16))
                                    .padding(.top,50)
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
                                    .foregroundColor(Color.loginLetterColor)
                                    .font(.custom("AppleSDGothicNeoM00", size:16))
                                    .padding(.top,12)
                                    .padding(.trailing,257)
                                    .padding(.leading,55)
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.loginTextFieldColor)
                                    .frame(height:40)
                                    .padding(.horizontal,50)
                                    .overlay(
                                        HStack {
                                            if showPassword == false {
                                                SecureField("",text: $passwordText)
                                                    .padding(.leading,60)
                                                    .padding(.trailing,130)
                                            } else {
                                                TextField("",text: $passwordText)
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
                                
                                NavigationLink {
                                    FIndPasswordView()
                                } label: {
                                    Text("Forgot Password?")
                                        .foregroundColor(.grayColor)
                                        .font(.custom("AppleSDGothicNeoM00", size: 12))
                                        .padding(.leading,56)
                                        .padding(.trailing,244)
                                }
                            }
                            
                            Rectangle()
                                .foregroundColor(.loginColor)
                                .frame(height:40)
                                .cornerRadius(10)
                                .overlay(
                                    Text("로그인")
                                        .foregroundColor(.white)
                                        .font(.system(size:15))
                                )
                                .padding(.horizontal,50)
                                .padding(.top,38)
                            
                            Spacer()
                            
                            NavigationLink {
                                SignupView()
                            } label: {
                                Text("아직 계정이 없으신가요?")
                                    .foregroundColor(.grayColor)
                                    .font(.custom("Apple", size: 12))
                                    .padding(.bottom,44)
                            }
                        }
                    }
                }
            } else {
                SplashView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            withAnimation {
                                showLoginView = true
                            }
                        }
                    }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
