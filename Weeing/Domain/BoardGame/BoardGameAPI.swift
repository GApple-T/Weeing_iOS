import Foundation
import Moya

enum BoardGameAPI {
    case show
}

extension BoardGameAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://3.34.34.162:8080/")!
    }
    
    var path: String {
        switch self {
        case .show:
            return "api/boardgame/list"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .show:
            return .get
        }
    }
    
    var sampleData: Data {
            return Data()
        }
    
    var task: Moya.Task {
        switch self {
        case .show:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        ["Authorization": "Bearer \(UserDefaults.standard.string(forKey: "accessToken") ?? "")"]
    }
}
