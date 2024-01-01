//
//  ConsultLogAPI.swift
//  Weeing
//
//  Created by 서지완 on 2023/09/26.
//

import Foundation
import Moya

enum ConsultLogAPI {
    case getList
}

extension ConsultLogAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://141.164.61.154:8080/")!
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
