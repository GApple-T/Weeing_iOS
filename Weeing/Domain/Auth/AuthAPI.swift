import Moya
import Foundation

enum AuthAPI {
    case login(req: LoginRequestDTO)
}

extension AuthAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://port-0-weeing-backend-eg4e2alkoplc4q.sel4.cloudtype.app/")!
    }
    
    var path: String {
        switch self {
        case .login:
            return "/api/auth/login"
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
        case .login(let req):
            return .requestJSONEncodable(req)
        }
    }
    
    var headers: [String : String]? {
        [:]
    }
}
