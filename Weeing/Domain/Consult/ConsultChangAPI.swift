//
//  ConsultChangAPI.swift
//  Weeing
//
//  Created by 서지완 on 1/1/24.
//

// ConsultChangAPI.swift

import Foundation
import Moya
import SwiftUI

struct ConsultChang: Codable {
    let id: String
    let time: String
}

enum ConsultChangAPI {
    case update(req: ConsultChang)
}

extension ConsultChangAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://141.164.61.154:8080/api/consulting/")!
    }

    var path: String {
        switch self {
        case .update:
            return "update"
        }
    }

    var method: Moya.Method {
        switch self {
        case .update:
            return .patch
        }
    }

    var task: Task {
        switch self {
        case let .update(req):
            return .requestJSONEncodable(req)
        }
    }

    var headers: [String: String]? {
        ["Authorization": "Bearer \(UserDefaults.standard.string(forKey: "accessToken") ?? "")"]
    }
}
