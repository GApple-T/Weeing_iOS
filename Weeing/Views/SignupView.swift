import SwiftUI

struct JoinView: View {
    
    @State private var pressedConfirm = false
    @State private var emailText = ""
    @State private var confirmNumber = ""
    
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
                    Text("Email")
                        .foregroundColor(.joinColor)
                        .font(.custom("AppleSDGothicNeoM00", size:16))
                        .padding(.top,66)
                        .padding(.trailing,297)
                        .padding(.leading,54)

                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.joinTextFieldColor)
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
                
                if pressedConfirm == true {
                    Group {
                        Text("인증번호")
                            .foregroundColor(.joinColor)
                            .font(.custom("AppleSDGothicNeoM00", size:15))
                            .padding(.top,12)
                            .padding(.trailing,282)
                            .padding(.leading,56)

                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.joinTextFieldColor)
                            .frame(height:40)
                            .padding(.horizontal,50)
                            .overlay(
                                    TextField("인증번호를 입력해주세요.",text: $confirmNumber)
                                        .font(.system(size:12))
                                        .padding(.leading,60)
                                        .padding(.trailing,130)
                            )
                    }
                }
                
                Button {
                    self.pressedConfirm.toggle()
                } label: {
                    Rectangle()
                        .foregroundColor(.joinColor)
                        .frame(height:40)
                        .cornerRadius(10)
                        .overlay(
                            Text("확인")
                                .font(.custom("AppleSDGothicNeoM00", size: 15))
                                .foregroundColor(.white)
                        )
                        .padding(.horizontal,50)
                        .padding(.top, pressedConfirm ? 60 : 48)
                }

                Spacer()
                
                if pressedConfirm == true {
                    Text("인증번호가 발송되지 않았나요?")
                        .foregroundColor(.grayColor)
                        .font(.custom("AppleSDGothicNeoM00", size: 12))
                        .padding(.bottom,44)
                } else if pressedConfirm == false {
                    Text("이미 계정이 있있으신가요?")
                        .foregroundColor(.grayColor)
                        .font(.custom("AppleSDGothicNeoM00",size:12))
                        .padding(.bottom,44)
                }
            }
        }
    }
}

struct JoinView_Previews: PreviewProvider {
    static var previews: some View {
        JoinView()
    }
}
