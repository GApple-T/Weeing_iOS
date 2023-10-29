import SwiftUI

enum signUp: Hashable {
    case email
    case confirmNumber
}

struct SignupView: View {
    @State private var pressedConfirm = false
    @State private var emailText = ""
    @State private var confirmNumber = ""
    @Environment(\.dismiss) var dismiss
    @FocusState private var focusField: signUp?

    var backButton: some View {
        Button {
            self.dismiss()
        } label: {
            HStack {
                Image(systemName: "chevron.left")
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.S40)
            }
        }
    }

    var body: some View {
        NavigationView {
            ZStack {
                Color.BG.ignoresSafeArea()
                VStack(spacing: 0) {
                    Text("Sign Up")
                        .font(.custom("Nunito-Black", size: 44))
                        .foregroundColor(.S30)
                        .padding(.horizontal, 112)
                        .padding(.top, 66)

                    WeeingEmailTextField(textFieldText: $emailText, textFieldColor: .SO3020, titleColor: .S30)
                        .padding(.top, 66)
                        .focused($focusField, equals: .email)
                        .onSubmit {
                            focusField = .confirmNumber
                            pressedConfirm = true
                        }

                    if pressedConfirm == true {
                        WeeingConfirmTextField(textFieldText: $confirmNumber, textFieldColor: .SO3020, titleColor: .S30)
                            .focused($focusField, equals: .confirmNumber)
                            .submitLabel(.done)
                            .padding(.top, 15)
                    }

                    Button {
                        self.pressedConfirm.toggle()
                    } label: {
                        startPageButton(buttonText: "확인", buttonColor: .S30)
                            .padding(.top, 44)
                    }

                    Spacer()

                    Button {
                        self.dismiss()
                    } label: {
                        if pressedConfirm == true {
                            Text("인증번호가 발송되지 않았나요?")
                                .foregroundColor(.N20)
                                .font(.custom("AppleSDGothicNeoM00", size: 12))
                                .padding(.bottom, 44)
                        } else if pressedConfirm == false {
                            Text("이미 계정이 있으신가요?")
                                .foregroundColor(.N20)
                                .font(.custom("AppleSDGothicNeoM00", size: 12))
                                .padding(.bottom, 44)
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
