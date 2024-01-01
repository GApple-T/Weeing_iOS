//
//  ProfileResponseDTO.swift
//  Weeing
//
//  Created by 한재형 on 1/1/24.
//

import Foundation

struct ProfileResponseDTO: Codable {
    let diaries: [ProfileDTO]

    struct ProfileDTO: Codable {
        let id: String
        let title: String
        let description: String
        let studentGrade: Int
        let studentClass: Int
    }
}
