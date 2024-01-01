import Foundation
import Moya

final class ConsultChangViewModel: ObservableObject {
    @Published var errorMessage = ""
    @Published var isDataLoaded = false
    @Published var deletedConsultId = ""
    @Published var classtime = ""
    let provider = MoyaProvider<ConsultChangAPI>(plugins: [LoggingPlugin()])

    func processSelectedConsultLog(id: UUID) {
        print("Selected Consult Log ID: \(id.uuidString)")
        updateConsultation(id: id, classtime: classtime)
    }

    func updateConsultation(id: UUID, classtime: String) {
        let req = ConsultChang(id: id.uuidString, time: classtime)
        provider.request(.update(req: req)) { result in
            switch result {
            case let .success(response):
                print("Response StatusCode:", response.statusCode)
                print("Consultation ID: \(id.uuidString)")
                print("Consultation Classtime: \(classtime)")

                if let responseDataString = String(data: response.data, encoding: .utf8) {
                    print("Response Data (Raw):", responseDataString)
                } else {
                    print("Failed to convert data to UTF-8 string")
                }

                if (200 ... 299).contains(response.statusCode) {
                    do {
                        let responseModel = try JSONDecoder().decode(ConsultChang.self, from: response.data)
                        print("Response Data:", responseModel)
                        self.isDataLoaded = true
                    } catch {
                        print("JSON Decoding Error: \(error)")
                        self.errorMessage = "JSON Decoding Error: \(error.localizedDescription)"
                    }
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
