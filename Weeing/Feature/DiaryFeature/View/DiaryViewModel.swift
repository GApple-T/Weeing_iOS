//
//  DiaryViewModel.swift
//  Weeing
//
//  Created by 서지완 on 1/1/24.
//

import Foundation
import Moya
import SwiftUI

final class DiaryViewModel: ObservableObject {
    @Published var title = ""
    @Published var diaryContent = ""
    @ObservedObject var login = LoginViewModel()
    private let diaryProvider = MoyaProvider<DiaryAPI>()

    func consultationSubmit(title: String, description: String) {
        diaryProvider.request(.submit(req: Diarys(title: title, description: description))) { result in
            print(title)
            print(description)
            switch result {
            case let .success(response):
                print(UserDefaults.standard.string(forKey: "accessToken") ?? "")
                print("공유일기 완료")
            case let .failure(error):
                print("네트워크 요청 실패: (error.localizedDescription)")
            }
        }
    }
}
