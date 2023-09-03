import SwiftUI

struct SignupView: View {
    
    @State private var pressedConfirm = false
    @State private var emailText = ""
    @State private var confirmNumber = ""
    @Environment(\.dismiss) var dismiss
    
    var backButton : some View {
        Button {
            self.dismiss()
        } label: {
            HStack {
                Image(systemName: "chevron.left")
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.joinColor)
            }
        }
        
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundColor.ignoresSafeArea()
                VStack {
                    Text("Sign Up")
                        .font(.custom("Nunito-Black", size: 44))
                        .foregroundColor(.joinColor)
                        .padding(.horizontal,112)
                        .padding(.top,86)
                    
                    WeeingEmailTextField(textFieldText: $emailText, textFieldColor: .joinTextFieldColor, titleColor: .joinColor)
                        .padding(.top,66)
                    
                    if pressedConfirm == true {
                        WeeingConfirmTextField(textFieldText: $confirmNumber, textFieldColor: .joinTextFieldColor, titleColor: .joinColor)
                    }
                    
                    Button {
                        self.pressedConfirm.toggle()
                    } label: {
                        startPageButton(buttonText: "확인", buttonColor: .joinColor)
                            .padding(.top,48)
                    }
                    
                    Spacer()
                    
                    Button {
                        self.dismiss()
                    } label: {
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
        }.navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton)
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
