//
//  ConsultationAPI.swift
//  Weeing
//
//  Created by 한재형 on 12/23/23.
//

import Foundation
import Moya
import SwiftUI

enum ConsultationAPI {
    case submit(req: ConsultRequestDTO)
}

extension ConsultationAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://141.164.61.154:8080/")!
    }

    var path: String {
        switch self {
        case .submit:
            return "api/consulting/submit"
        }
    }

    var method: Moya.Method {
        switch self {
        case .submit:
            return .post
        }
    }

    var task: Moya.Task {
        switch self {
        case let .submit(req):
            return .requestJSONEncodable(req)
        }
    }

    var headers: [String: String]? {
        ["Authorization": "Bearer \(UserDefaults.standard.string(forKey: "accessToken") ?? "")"]
    }
}
