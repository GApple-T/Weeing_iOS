import Foundation
import Moya

public protocol WeeingAPI: TargetType, JwtAuthorizable {
    associatedtype ErrorType: Error
    var domain: WeeingDomain { get }
    var urlPath: String { get }
    var errorMap: [Int: ErrorType] { get }
}

public extension WeeingAPI {
    var baseURL: URL {
        URL(
            string: Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String ?? ""
        ) ?? URL(string: "http://ec2-3-36-90-66.ap-northeast-2.compute.amazonaws.com:8080/api")!
    }

    var path: String {
        domain.asURLString + urlPath
    }

    var headers: [String: String]? {
        ["Content-Type": "application/json"]
    }

    var validationType: ValidationType {
        return .successCodes
    }
}

public enum WeeingDomain: String {
    case auth
}

extension WeeingDomain {
    var asURLString: String {
        "/\(self.rawValue)"
    }
}
