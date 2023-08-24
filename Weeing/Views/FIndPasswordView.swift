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
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            VStack {
                Text("Find Password")
                    .font(.custom("Nunito-Black", size: 35))
                    .foregroundColor(.findPasswordColor)
                    .padding(.top,109)
                    .padding(.horizontal,70)
                
                Text(pressedConfirm ? "" : "회원가입 시 사용하신 이메일을 입력해주세요.\n    이메일로 인증번호를 보내드리겠습니다.")
                    .font(.custom("AppleSDGothicNeoM00", size: 12))
                    .foregroundColor(.grayColor)
                    .padding(.horizontal,88.5)
                    .padding(.top,pressedConfirm ? 0 : 14)
                
                Text("Email")
                    .font(.custom("AppleSDGothicNeoM00", size: 16))
                    .foregroundColor(.findPasswordColor)
                    .padding(.top,pressedConfirm ? 70 : 67)
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
                            Text("확인")
                                .font(.custom("AppleSDGothicNeoM00", size: 15))
                                .foregroundColor(.white)
                        )
                        .padding(.horizontal,50)
                        .padding(.top,48)
                }

                Spacer()
                
                if pressedConfirm == false {
                    Text("비밀번호를 재설정할 필요가 없나요?")
                        .font(.custom("AppleSDGothicNeoM00", size: 12))
                        .foregroundColor(.grayColor)
                        .padding(.bottom,44)
                        .padding(.horizontal,110)
                } else {
                    Text("인증번호가 발송되지 않았나요?")
                        .font(.custom("AppleSDGothicNeoM00", size: 12))
                        .foregroundColor(.grayColor)
                        .padding(.bottom,44)
                        .padding(.horizontal,122)
                }
                
            }
        }
    }
}

struct FIndPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        FIndPasswordView()
    }
}
