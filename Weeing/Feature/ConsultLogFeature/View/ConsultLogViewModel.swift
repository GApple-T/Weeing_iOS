//
//  ConsultLogViewModel.swift
//  Weeing
//
//  Created by 서지완 on 12/14/23.
//

// ConsultLogViewModel.swift
import Foundation
import Moya

// ConsultLogViewModel.swift
final class ConsultLogViewModel: ObservableObject {
    @Published var errorMessage = ""
    @Published var isDataLoaded = false
    @Published var consults: [ConsultLogModel.Consult] = []
    let provider = MoyaProvider<ConsultLogAPI>(plugins: [LoggingPlugin()])

    func loadConsultLogs() {
        provider.request(.getList) { result in
            switch result {
            case let .success(response):
                print("ㅁㄴㅇㄹ  \(String(data: response.data, encoding: .utf8))")
                print(response.statusCode)
                do {
                    let responseModel = try JSONDecoder().decode(ConsultLogModel.self, from: response.data)
                    print(responseModel)
                    self.consults = responseModel.consults // 변경된 부분
                    self.isDataLoaded = true

                } catch {
                    print("JSON 디코딩 에러: \(error)")
                    self.errorMessage = "JSON 디코딩 에러: \(error.localizedDescription)"
                }

            case let .failure(error):
                self.errorMessage = "네트워크 요청 실패: \(error.localizedDescription)"
            }
        }
    }
}
