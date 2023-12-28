import Foundation
import Moya

enum AuthAPI {
    case login(req: LoginRequestDTO)
}

extension AuthAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://3.34.34.162:8080/")!
    }

    var path: String {
        switch self {
        case .login:
            return "api/auth/login"
        }
    }

    var method: Moya.Method {
        switch self {
        case .login:
            return .post
        }
    }

    var task: Moya.Task {
        switch self {
        case let .login(req):
            return .requestJSONEncodable(req)
        }
    }

    var headers: [String: String]? {
        [:]
    }
}
