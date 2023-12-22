import Foundation
import Moya
import Combine

final class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var passwordHelpMessage = "비밀번호를 잊어버리셨나요?"
    @Published var isLoginSuccessful = false
    private let authProvider = MoyaProvider<AuthAPI>(plugins: [LoggingPlugin()])

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
        authProvider.request(.login(req: .init(email: email, password: password))) { result in
            switch result {
            case .success(let res):
                print(res.statusCode)
                switch res.statusCode {
                case 200:
                    self.isLoginSuccessful = true
                    print(String(data: res.data, encoding: .utf8))
                case 400:
                    print("악 BAD REQUEST 400")
                    print(String(data: res.data, encoding: .utf8))
                case 404:
                    print("NOT_FOUND")
                    print(String(data: res.data, encoding: .utf8))
                default:
                    print("????")
                }
                
            case .failure(let err):
                print(err.localizedDescription)
            }
            
        }
    }
}
