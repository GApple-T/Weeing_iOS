import Foundation
import Moya

enum BoardGameAPI {
    case show
    case submit(req: BoardGameSubmitRequestDTO)
}

extension BoardGameAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://141.164.61.154:8080/")!
    }

    var path: String {
        switch self {
        case .show:
            return "api/boardgame/list"
        case .submit:
            return "api/boardgame/submit"
        }
    }

    var method: Moya.Method {
        switch self {
        case .show:
            return .get
        case .submit:
            return .post
        }
    }

    var task: Moya.Task {
        switch self {
        case .show:
            return .requestPlain
        case let .submit(req):
            return .requestJSONEncodable(req)
        }
    }

    var headers: [String: String]? {
        ["Authorization": "Bearer \(UserDefaults.standard.string(forKey: "accessToken") ?? "")"]
    }
}
