// DiaryListViewModel.swift
import Foundation
import Moya

final class DiaryListViewModel: ObservableObject {
    @Published var errorMessage = ""
    @Published var isDataLoaded = false
    @Published var diaries: [DiaryResponseDTO.Diaries] = []
    let provider = MoyaProvider<DiaryListAPI>(plugins: [LoggingPlugin()])

    func loadConsultLogs(button: Int?) {
        provider.request(.getList(req: DiaryRequestDTO(studentGrade: button, studentClass: nil))) { result in
            switch result {
            case let .success(response):
                print(String(data: response.data, encoding: .utf8))
                do {
                    let decoder = JSONDecoder()
                    let responseModel = try decoder.decode(DiaryResponseDTO.self, from: response.data)
                    self.diaries = responseModel.diaries
                    self.isDataLoaded = true
                } catch {
                    print("JSON Decoding Error: \(error)")
                    self.errorMessage = "Failed to decode JSON response"
                }

            case let .failure(err):
                self.errorMessage = "Network request failed: \(err.localizedDescription)"
                print("Network request failed: \(err)")
            }
        }
    }
}
