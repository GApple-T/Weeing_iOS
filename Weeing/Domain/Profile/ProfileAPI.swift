//
//  ProfileAPI.swift
//  Weeing
//
//  Created by 한재형 on 1/1/24.
//

import Foundation
import Moya

enum ProfileAPI {
    case getDiary
}

extension ProfileAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://141.164.61.154:8080/")!
    }

    var path: String {
        switch self {
        case .getDiary:
            return "api/diary/my-list"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getDiary:
            return .get
        }
    }

    var task: Moya.Task {
        switch self {
        case .getDiary:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        ["Authorization": "Bearer \(UserDefaults.standard.string(forKey: "accessToken") ?? "")"]
    }
}
