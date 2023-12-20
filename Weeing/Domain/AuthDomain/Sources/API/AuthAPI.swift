import Foundation
import Moya


public enum AuthAPI {
    case login(LoginRequestDTO)
}

extension AuthAPI: WeeingAPI {
    
    public typealias ErrorType = AuthDomainError
    
    public var domain: WeeingDomain {
        .auth
    }
    
    public var urlPath: String {
        switch self {
        case .login:
            return "/login"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .login:
            return .post
        }
    }
    
    public var task: Moya.Task {
        switch self {
        case let .login(req):
            return .requestJSONEncodable(req)
            
        default:
            return .requestPlain
        }
    }
    
    public var jwtTokenType: JwtTokenType {
        switch self {
        default:
            return .none
        }
    }
    
    public var errorMap: [Int: ErrorType] {
        switch self {
        case .login:
            return [
                404: .notFoundAuthInfo,
                400: .badRequest
            ]
        }
    }
}
