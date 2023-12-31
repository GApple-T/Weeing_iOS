import Foundation
import Moya

final class BoardGameViewModel: ObservableObject {
    @Published var errorMessage = ""
    @Published var boardgames: [BoardGameShowResponseDTO.BoardGameDTO] = []
    let provider = MoyaProvider<BoardGameAPI>(plugins: [LoggingPlugin()])
    
    func getBoardGameDetail() {
        provider.request(.show) { result in
            switch result {
            case let .success(res):
                do {
                    let decoder = JSONDecoder()
                    let responseModel = try decoder.decode(BoardGameShowResponseDTO.self, from: res.data)

                    self.boardgames = responseModel.boardgames
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
