//
//  ConsultLogModel.swift
//  Weeing
//
//  Created by 서지완 on 12/27/23.
//

import Foundation

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

        do {
            success = try container.decode(String.self, forKey: .success)
        } catch {
            success = ""
        }
    }

    private enum CodingKeys: String, CodingKey {
        case consults, success
    }
}
