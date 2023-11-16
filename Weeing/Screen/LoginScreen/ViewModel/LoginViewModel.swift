import Foundation

final class LoginViewModel: ObservableObject {
    @Published var emailText = ""
    @Published var passwordText = ""
    @Published var passwordHelpMessage = "비밀번호를 잊어버리셨나요?"

    var isEmailErrorOccured: Bool {
        if emailText.isEmpty {
            return false
        }
        if checkEmail(emailText) {
            return false
        } else {
            return true
        }
    }

    var emailHelpMessage: String {
        if isEmailErrorOccured {
            return "학교 이메일을 입력해주세요"
        } else {
            return ""
        }
    }

    var isPasswordErrorOcuured: Bool {
        if passwordText.isEmpty {
            return false
        }
        if checkPassword(passwordText) {
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
}
