import Foundation
import Moya

final class LoginViewModel: BaseViewModel {
    @Published var email = ""
    @Published var password = ""
    @Published var passwordHelpMessage = "비밀번호를 잊어버리셨나요?"
    @Published var isLoginSuccessful = false
    private let loginUseCase: any LoginUseCase
    
    init(loginUseCase: any LoginUseCase) {
            self.loginUseCase = loginUseCase
        }

    var isEmailErrorOccured: Bool {
        if email.isEmpty {
            return false
        }
        if checkEmail(email) {
            return false
        } else {
            return true
        }
    }

    var emailHelpMessage: String {
        if isEmailErrorOccured {
            return "학교 이메일을 입력해주세요"
        } else if isErrorOccurred == true {
            return "아직 승인되지 않은 계정입니다."
        } else {
            return ""
        }
    }

    var isPasswordErrorOcuured: Bool {
        if password.isEmpty {
            return false
        }
        if checkPassword(password) {
            return false
        } else {
            return true
        }
    }

    func checkEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }

    func checkPassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[a-zA-Z0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,24}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }
    
    func login() {
        guard checkEmail(email) && checkPassword(password) else { return }
        
        _Concurrency.Task {
            do {
                try await loginUseCase(req: LoginRequestDTO(email: email, password: password))
                print("로그인 성공")
            } catch {
                isErrorOccurred = true
                print("로그인 실패: \(error)")
            }
        }
        
    }
}
