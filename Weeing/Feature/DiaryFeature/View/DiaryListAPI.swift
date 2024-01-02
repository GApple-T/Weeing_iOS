import Foundation
import Moya

enum DiaryListAPI {
    case getList(req: DiaryRequestDTO)
}

extension DiaryListAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://141.164.61.154:8080/api/diary/")!
    }

    var path: String {
        switch self {
        case .getList:
            return "list"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getList:
            return .get
        }
    }

    var task: Task {
        switch self {
        case let .getList(req):
            return .requestParameters(
                parameters: [
                    "grade": req.studentGrade ?? "",
                    "classroom": req.studentClass ?? "",
                ],
                encoding: URLEncoding.queryString
            )
        }
    }

    var headers: [String: String]? {
        ["Authorization": "Bearer \(UserDefaults.standard.string(forKey: "accessToken") ?? "")"]
    }
}
