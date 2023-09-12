//
//  LoginView.swift
//  Weeing
//
//  Created by 이승화 on 2023/08/22.
//

import SwiftUI

enum login: Hashable {
    case email
    case password
}

struct LoginView: View {
    
    @State private var emailText = ""
    @State private var passwordText = ""
    @State private var showPassword = false
    @State private var showLoginView = false
    @FocusState private var focusField: login?
    
    var body: some View {
        ZStack {
            if showLoginView {
                NavigationView {
                    ZStack {
                        Color.backgroundColor.ignoresSafeArea()
                        VStack(spacing:0) {
                            Text("Login")
                                .foregroundColor(.loginColor)
                                .font(.custom("Nunito-Black",size: 45))
                                .padding(.horizontal,134)
                                .padding(.top,109)
                            
                            WeeingEmailTextField(textFieldText: $emailText, textFieldColor: .loginTextFieldColor, titleColor: .loginColor)
                                .padding(.top,65)
                                .focused($focusField, equals: .email)
                                .onSubmit {
                                    focusField = .password
                                }
                            
                            WeeingPasswordTextField(textFieldText: $passwordText, pressedEye: $showPassword, textFieldColor: .loginTextFieldColor, titleColor: .loginColor)
                                .padding(.top,20)
                                .focused($focusField, equals: .password)
                                .submitLabel(.done)
                                
                                NavigationLink {
                                    FIndPasswordView()
                                } label: {
                                    Text("비밀번호를 잊어버리셨나요?")
                                        .foregroundColor(.grayColor)
                                        .font(.custom("AppleSDGothicNeoM00", size: 12))
                                        .padding(.leading,52)
                                        .padding(.trailing,202)
                                        .padding(.top,4)
                                }
                            
                            startPageButton(buttonText: "로그인", buttonColor: .loginColor)
                                .padding(.top,40)
                            
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
