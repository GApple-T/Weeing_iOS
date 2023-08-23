//
//  makePasswordView.swift
//  Weeing
//
//  Created by 이승화 on 2023/08/23.
//

import SwiftUI

struct makePasswordView: View {
    
    @State private var passwordText = ""
    @State private var checkPasswordText = ""
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            VStack {
                Text("Sign Up")
                    .font(.custom("Nunito-Black", size: 44))
                    .foregroundColor(.joinColor)
                    .padding(.horizontal,112)
                    .padding(.top,109)
                
                Group {
                    Text("Password")
                        .foregroundColor(.joinColor)
                        .font(.custom("AppleSDGothicNeoB00", size:16))
                        .padding(.top,12)
                        .padding(.trailing,263)
                        .padding(.leading,58)

                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.joinTextFieldColor)
                        .frame(height:40)
                        .padding(.horizontal,50)
                        .overlay(
                            ZStack {
                                SecureField("",text: $passwordText)
                                    .font(.system(size:12))
                                    .padding(.leading,60)
                                    .padding(.trailing,130)
                                
                                Image(systemName: "eye")
                                    .resizable()
                                    .frame(width:15,height: 10)
                                    .foregroundColor(.grayColor)
                                    .padding(.leading,258)
                            }
                        )
                    
                    
                    Text("비밀번호는 8~16자 사이여야되며, 특수문자를 포함해야합니다.")
                        .font(.custom("AppleSDGothicNeoM00", size: 9))
                        .foregroundColor(.grayColor)
                        .padding(.leading,58)
                        .padding(.trailing,112)
                }
                
                Group {
                    Text("Check Password")
                        .foregroundColor(.joinColor)
                        .font(.custom("AppleSDGothicNeoB00", size:15))
                        .padding(.top,12)
                        .padding(.trailing,223)
                        .padding(.leading,58)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.joinTextFieldColor)
                        .frame(height:40)
                        .padding(.horizontal,50)
                        .overlay(
                                SecureField("",text: $checkPasswordText)
                                    .font(.system(size:12))
                                    .padding(.leading,60)
                                    .padding(.trailing,130)
                        )
                }
                
                    Rectangle()
                        .foregroundColor(.joinColor)
                        .frame(height:40)
                        .cornerRadius(10)
                        .overlay(
                            Text("회원가입")
                                .font(.custom("AppleSDGothicNeoB00", size: 15))
                                .foregroundColor(.white)
                        )
                        .padding(.horizontal,65)
                        .padding(.top,52)

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
