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
    @Published var diary: [ProfileResponseDTO.ProfileDTO] = []

    func getDiary() {
        diaryProvider.request(.getDiary) { result in
            switch result {
            case let .success(res):
                print("프로필 : \(res.statusCode)")
                do {
                    let decoder = JSONDecoder()
                    let responseModel = try decoder.decode(ProfileResponseDTO.self, from: res.data)

                    DispatchQueue.main.async {
                        self.diary = responseModel.diaries
                    }
                    print(responseModel.diaries.first?.title ?? "")
                    print(responseModel.diaries.first?.description ?? "")
                } catch {
                    print("JSON Decoding Error: \(error)")
                }

            case let .failure(err):
                print("프로필 불러오기 실패 \(err.localizedDescription)")
            }
        }
    }
}
