import SwiftUI

enum Login: Hashable {
    case email
    case password
}

struct LoginView: View {
    @State private var showPassword = false
    @State private var showLoginView = false
    @FocusState private var focusField: Login?
    @StateObject var viewModel: LoginViewModel

    var body: some View {
        ZStack {
            if showLoginView {
                NavigationView {
                    ZStack {
                        Color.BG.ignoresSafeArea()

                        VStack(spacing: 0) {
                            Text("Login")
                                .foregroundColor(Color.P30)
                                .font(.custom("Nunito-Black", size: 45))
                                .padding(.horizontal, 134)
                                .padding(.top, 109)

                            WeeingEmailTextField(
                                textFieldText: $viewModel.email,
                                titleColor: .S20,
                                isError: viewModel.isEmailErrorOccured
                            )
                            .padding(.top, 65)
                            .focused($focusField, equals: .email)
                            .onSubmit {
                                focusField = .password
                            }

                            WeeingPasswordTextField(
                                textFieldText: $viewModel.password,
                                isSecure: $showPassword,
                                titleColor: .S20,
                                helpMessage: "비밀번호를 잊어버리셨나요?",
                                link: "비밀번호 찾기",
                                isError: viewModel.isPasswordErrorOcuured
                            )
                            .padding(.top, 20)
                            .focused($focusField, equals: .password)
                            .submitLabel(.done)

                            StartPageButton(
                                buttonText: "로그인",
                                buttonColor: .P30
                            )
                            .onTapGesture {
                                viewModel.login()
                            }
                            .padding(.top, 40)

                            Spacer()

                            NavigationLink {
                                SignupView()
                            } label: {
                                Text("아직 계정이 없으신가요?")
                                    .foregroundColor(.N20)
                                    .font(.custom("AppleSDGothicNeoM00", size: 12))
                                    .padding(.bottom, 44)
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
