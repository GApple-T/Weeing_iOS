//
//  DiaryResponseDTO.swift
//  Weeing
//
//  Created by 서지완 on 1/2/24.
//

import Foundation

struct DiaryResponseDTO: Decodable {
    let diaries: [Diaries]

    struct Diaries: Decodable {
        let id: UUID
        let title: String
        let description: String
        let studentGrade: Int
        let studentClass: Int

        enum CodingKeys: String, CodingKey {
            case id, title, description
            case studentGrade = "grade"
            case studentClass = "classroom"
        }
    }

//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        diaries = try container.decode([Diaries].self, forKey: .diaries)
//
//        do {
//            success = try container.decode(String.self, forKey: .success)
//        } catch {
//            success = ""
//        }
//    }
//
//    private enum CodingKeys: String, CodingKey {
//        case diaries, success
//    }
}
