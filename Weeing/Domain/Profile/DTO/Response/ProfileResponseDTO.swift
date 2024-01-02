//
//  ProfileResponseDTO.swift
//  Weeing
//
//  Created by 한재형 on 1/1/24.
//

import Foundation

struct ProfileResponseDTO: Codable {
//    let id: String
    let diaries: [ProfileDTO]
    let name: String
    let grade: Int
    let classroom: Int
    let number: Int

    struct ProfileDTO: Codable, Identifiable {
        let id: String
        let title: String
        let description: String
        let grade: Int
        let classroom: Int
    }
}
