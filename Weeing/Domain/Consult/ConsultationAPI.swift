//
//  ConsultationAPI.swift
//  Weeing
//
//  Created by 한재형 on 12/23/23.
//

import Foundation
import Moya
import SwiftUI

struct Consultation: Codable {
    let classTime: Int
    let description: String
}

enum ConsultationAPI {
    case submit(req: Consultation)
}

extension ConsultationAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://3.34.34.162:8080/api/consulting/")!
    }

    var path: String {
        switch self {
        case .submit:
            return "submit"
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
        ["Authorization": UserDefaults.standard.string(forKey: "accessToken") ?? ""]
    }
}
