import PopupView
import SwiftUI

struct BoardGameView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    @State private var isShownsheet = false
    @State private var isApplication = false
    @State private var isAlert = false
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = BoardGameViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                Color.BG.ignoresSafeArea()
                VStack(spacing: 0) {
                    Text("보드게임 예약")
                        .font(.custom("AppleSDGothicNeoB00", size: 22))
                        .padding(.leading, 20)
                        .padding(.trailing, 241)
                        .padding(.top, 11)

                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(viewModel.boardgames) { boardgame in
                            Button {
                                self.isShownsheet.toggle()
                            } label: {
                                reservationGrid(
                                    backColor: viewModel.emptyPeople ? .white : .Shadow,
                                    itemColor: viewModel.emptyPeople ? .S30 : .empty_dice,
                                    name: "개최자 : \(boardgame.creator.info)",
                                    status: viewModel.emptyPeople ? "남은 자리 \(boardgame.maxOf - boardgame.joined)개" : "모집완료",
                                    isShownSheet: isShownsheet,
                                    dice: viewModel.emptyPeople ? "dice" : "empty_dice"
                                )
                            }
                            .sheet(isPresented: $isShownsheet) {
                                reservationList(
                                    creator: boardgame.creator.info,
                                    players: boardgame.players
                                )
                                .presentationDetents([.height(300)])
                            }
                        }
                    }
                    .padding(.horizontal, 15)

                    Spacer()

                    Button {
                        self.isApplication.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 70, height: 70)
                            .foregroundStyle(Color.S40)
                    }
                    .padding(.leading, 305)
                    .padding(.trailing, 15)
                    .padding(.bottom, 15)
                    .fullScreenCover(isPresented: $isApplication) {
                        BoardGameApplicationView()
                    }
                }
            }
            .onAppear {
                viewModel.getBoardGameDetail()
            }
        }
    }

    @ViewBuilder
    func reservationGrid(backColor: Color, itemColor: Color, name: String, status: String, isShownSheet _: Bool, dice: String) -> some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 13)
                    .foregroundStyle(backColor)
                    .frame(width: 112, height: 140)
                    .shadow(color: Color("Shadow"), radius: 15, y: -7)

                VStack(spacing: 0) {
                    Image("\(dice)")
                        .resizable()
                        .frame(width: 28, height: 28)
                        .foregroundStyle(itemColor)
                        .padding(.top, 26)

                    Text(name)
                        .font(.custom("AppleSDGothicNeoSB00", size: 10))
                        .foregroundStyle(Color.black)
                        .padding(.top, 26)

                    Text(status)
                        .font(.custom("AppleSDGothicNeoSB00", size: 10))
                        .foregroundStyle(itemColor)
                        .padding(.top, 11)
                        .padding(.bottom, 18)
                }
            }
            .padding(.top, 40)

            Spacer()
        }
    }

    @ViewBuilder
    func reservationList(creator: String, players: [String]) -> some View {
        ZStack {
            Color.BG.ignoresSafeArea()
            VStack(spacing: 0) {
                Text("2024.01.03 점심시간")
                    .font(.custom("AppleSDGothicNeoB00", size: 20))
                    .padding(.top, 26)

                Text("개최자 : \(creator)")
                    .font(.custom("AppleSDGothicNeoEB00", size: 15))
                    .foregroundStyle(Color.S30)
                    .padding(.top, 32)

                Text("참가자 : \(players.joined(separator: ", "))")
                    .font(.custom("AppleSDGothicNeoEB00", size: 15))
                    .frame(width: 290)
                    .padding(.top, 10)

                Button {
                    dismiss()
                } label: {
                    Text("참가 신청")
                        .font(.custom("AppleSDGothicNeoB00", size: 18))
                        .frame(width: 360, height: 54)
                        .background(Color.S30)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .foregroundStyle(Color.white)
                        .padding(.top, 65)
                }
            }
        }
    }
}

struct BoardGameView_Previews: PreviewProvider {
    static var previews: some View {
        BoardGameView()
    }
}
