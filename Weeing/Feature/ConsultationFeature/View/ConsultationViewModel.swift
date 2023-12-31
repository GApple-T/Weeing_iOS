//
//  ConsultationViewModel.swift
//  Weeing
//
//  Created by 한재형 on 12/23/23.
//

import Foundation
import Moya
import SwiftUI

final class ConsultationViewModel: ObservableObject {
    @Published var classTime = 0
    @Published var consultationContent = ""
    @ObservedObject var login = LoginViewModel()
    private let consultationProvider = MoyaProvider<ConsultationAPI>()

    func consultationSubmit() {
        consultationProvider.request(.submit(req: Consultation(classTime: classTime, description: consultationContent))) { result in
            switch result {
            case let .success(response):
                print(UserDefaults.standard.string(forKey: "accessToken") ?? "")
                print("상담 신청 성공")
            case let .failure(error):
                print("네트워크 요청 실패: \(error.localizedDescription)")
            }
        }
    }
}