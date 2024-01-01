//
//  ProfileViewModel.swift
//  Weeing
//
//  Created by 한재형 on 1/1/24.
//

import Foundation
import Moya

final class ProfileViewModel: ObservableObject {
    @Published var title = ""
    @Published var description = ""
    let diaryProvider = MoyaProvider<ProfileAPI>(plugins: [LoggingPlugin()])

    func getDiary() {
        diaryProvider.request(.getDiary) { result in
            switch result {
            case let .success(res):
                print("프로필 : \(res.statusCode)")
                print(res.statusCode)
                do {
                    let decoder = JSONDecoder()
                    let responseModel = try decoder.decode(ProfileResponseDTO.self, from: res.data)
                    self.title = responseModel.diaries.first?.title ?? ""
                } catch {
                    print("JSON Decoding Error: \(error)")
                }

            case let .failure(err):
                print("프로필 불러오기 실패 \(err.localizedDescription)")
            }
        }
    }
}
