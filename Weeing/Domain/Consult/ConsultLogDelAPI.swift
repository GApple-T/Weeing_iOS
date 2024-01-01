//
//  ConsultLogDelAPI.swift
//  Weeing
//
//  Created by 서지완 on 1/1/24.
//

// ConsultLogDelAPI.swift

import Foundation
import Moya

enum ConsultLogDelAPI {
    case submit(req: ConsultDelete)
}

extension ConsultLogDelAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://141.164.61.154:8080/api/consulting/")!
    }

    var path: String {
        switch self {
        case .submit:
            return "cancle"
        }
    }

    var method: Moya.Method {
        switch self {
        case .submit:
            return .delete
        }
    }

    var task: Task {
        switch self {
        case let .submit(req):
            return .requestJSONEncodable(req)
        }
    }

    var headers: [String: String]? {
        ["Authorization": "Bearer \(UserDefaults.standard.string(forKey: "accessToken") ?? "")"]
    }
}
