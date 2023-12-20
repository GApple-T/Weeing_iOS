import Foundation

public enum AuthDomainError: Error {
    case badRequest
    case notFoundAuthInfo
}

extension AuthDomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .badRequest:
            return "요청이 잘못되었습니다."
            
        case .notFoundAuthInfo:
            return "인증 정보를 찾을 수 없습니다."
        }
    }
}
