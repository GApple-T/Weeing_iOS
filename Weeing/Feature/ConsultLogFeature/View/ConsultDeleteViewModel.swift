//
//  ConsultDeleteViewModel.swift
//  Weeing
//
//  Created by 서지완 on 1/1/24.
//

// ConsultDeleteViewModel.swift

import Foundation
import Moya

final class ConsultDeleteViewModel: ObservableObject {
    @Published var errorMessage = ""
    @Published var isDataLoaded = false
    @Published var deletedConsultId = ""
    let provider = MoyaProvider<ConsultLogDelAPI>(plugins: [LoggingPlugin()])

    func processSelectedConsultLog(id: UUID) {
        print("Selected Consult Log ID: \(id.uuidString)")
        deleteConsultation(id: id)
    }

    func deleteConsultation(id: UUID) {
        let req = ConsultDelete(id: id.uuidString)
        provider.request(.submit(req: req)) { result in
            switch result {
            case let .success(response):
                print("Response StatusCode:", response.statusCode)
                print("Consultation ID: \(id.uuidString)")
                print(self.deletedConsultId)

                if let responseDataString = String(data: response.data, encoding: .utf8) {
                    print("Response Data (Raw):", responseDataString)
                } else {
                    print("Failed to convert data to UTF-8 string")
                }

                if (200 ... 299).contains(response.statusCode) {
                    do {
                        let responseModel = try JSONDecoder().decode(ConsultDelete.self, from: response.data)
                        print("Response Data:", responseModel)
                        self.deletedConsultId = responseModel.id
                        self.isDataLoaded = true
                        print(self.deletedConsultId)
                    } catch {}
                } else {
                    self.errorMessage = "Network Request Failure: \(response.statusCode)"
                }

            case let .failure(error):
                print("Network Request Failure:", error.localizedDescription)
                self.errorMessage = "Network Request Failure: \(error.localizedDescription)"
            }
        }
    }
}
