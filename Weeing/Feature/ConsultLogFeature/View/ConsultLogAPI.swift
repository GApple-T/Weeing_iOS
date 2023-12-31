import Foundation
import Moya
import SwiftUI

enum ConsultLogAPI {
    case getList
}

extension ConsultLogAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://3.34.34.162:8080/")!
    }

    var path: String {
        switch self {
        case .getList:
            return "api/consulting/my-list"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getList:
            return .get
        }
    }

    var task: Task {
        return .requestPlain
    }

    var headers: [String: String]? {
        ["Authorization": "Bearer \(UserDefaults.standard.string(forKey: "accessToken") ?? "")"]
    }
}
