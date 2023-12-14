//
//  HomeViewModel.swift
//  Weeing
//
//  Created by 한재형 on 12/14/23.
//

import Foundation
import Moya

final class HomeViewModel: ObservableObject {
    @Published var errorMessage = ""
    @Published var information: [String: String] = [:]
    @Published var TF = false
    let provider = MoyaProvider<GetTimeTable>()

    func loadTimeTable() {
        provider.request(.getTimeTable) { result in
            switch result {
            case let .success(response):
                do {
                    let information = try JSONDecoder().decode(TimeTable.self, from: response.data)

                    guard let x = information.hisTimetable?.last?.row else {
                        return print("nil")
                    }
                    for i in 0 ... 7 {
                        self.information[x[i].PERIO] = x[i].ITRT_CNTNT
                    }
                    print(self.information)
                } catch {
                    self.errorMessage = "JSON 디코딩 에러: \(error)"
                }
            case let .failure(error):
                self.errorMessage = "네트워크 요청 실패: \(error.localizedDescription)"
            }
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            self.TF.toggle()
        }
    }
}
