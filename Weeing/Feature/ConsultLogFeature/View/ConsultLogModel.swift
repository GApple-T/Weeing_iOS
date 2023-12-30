//
//  ConsultLogModel.swift
//  Weeing
//
//  Created by 서지완 on 12/27/23.
//

// import Foundation
// import Moya
//
// struct ConsultLogModel: Decodable {
//    let consults: [Consult]
//    let success: String
//
//    struct Consult: Decodable {
//        let id: UUID
//        let issuedAt: Int
//        let time: Int
//        let description: String
//    }
// }

import Foundation
import Moya

struct ConsultLogModel: Decodable {
    let consults: [Consult]
    let success: String

    struct Consult: Decodable {
        let id: UUID
        let issuedAt: Int
        let time: Int
        let description: String
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        consults = try container.decode([Consult].self, forKey: .consults)

        // "success" 키가 없는 경우를 고려하여 예외 처리
        do {
            success = try container.decode(String.self, forKey: .success)
        } catch {
            success = "" // 혹은 원하는 기본값으로 설정
        }
    }

    private enum CodingKeys: String, CodingKey {
        case consults, success
    }
}
