import Foundation
import Moya

final class BoardGameViewModel: ObservableObject {
    @Published var maxOf: Int = 0
    @Published var errorMessage = ""
    @Published var id: String = ""
    @Published var boardgames: [BoardGameShowResponseDTO.BoardGameDTO] = []
    @Published var selectedBoardGame: BoardGameShowResponseDTO.BoardGameDTO?
    let provider = MoyaProvider<BoardGameAPI>(plugins: [LoggingPlugin()])

    var emptyPeople: Bool {
        if maxOf == 0 {
            return true
        } else {
            return false
        }
    }

    func studentNumber(grade: Int, classroom: Int, number: Int, name: String) -> String {
        if number < 2 {
            UserDefaults.standard.set("\(grade)" + "\(classroom)" + "0" + "\(number)" + " \(name)", forKey: "number")
            return "\(grade)" + "\(classroom)" + "0" + "\(number)" + " \(name)"
        } else {
            UserDefaults.standard.set("\(grade)" + "\(classroom)" + "\(number)" + " \(name)", forKey: "number2")
            return "\(grade)" + "\(classroom)" + "\(number)" + " \(name)"
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

    func joinBoardGame() {
        guard let selectedBoardGame = selectedBoardGame else {
            print("Error: Selected board game is nil.")
            return
        }

        id = selectedBoardGame.id

        provider.request(.join(req: BoardGameJoinRequestDTO(id: id))) { result in
            switch result {
            case let .success(res):
                print(res.statusCode)
                self.getBoardGameDetail()
            case let .failure(err):
                print(err.localizedDescription)
            }
        }
    }
}
