//
//  DiaryAPI.swift
//  Weeing
//
//  Created by 서지완 on 1/1/24.
//

import Foundation
import Moya
import SwiftUI

struct Diarys: Codable {
    let title: String
    let description: String
}

enum DiaryAPI {
    case submit(req: Diarys)
}

extension DiaryAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://141.164.61.154:8080/api/diary/")!
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
        ["Authorization": "Bearer (UserDefaults.standard.string(forKey: "accessToken") ?? "")"]
    }
}
