import Foundation
import Moya

final class BoardGameViewModel: ObservableObject {
    @Published var maxOf: Int = 0
    @Published var errorMessage = ""
//    @Published var emptyPeople = false
    @Published var boardgames: [BoardGameShowResponseDTO.BoardGameDTO] = []
    let provider = MoyaProvider<BoardGameAPI>(plugins: [LoggingPlugin()])

    var emptyPeople: Bool {
        if maxOf == 0 {
            return true
        } else {
            return false
        }
    }

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

    func submitBoardGame() {
        provider.request(.submit(req: BoardGameSubmitRequestDTO(maxOf: maxOf))) { result in
            switch result {
            case let .success(res):
                print(res.statusCode)
            case let .failure(err):
                print(err.localizedDescription)
            }
        }
    }
}
