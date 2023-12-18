import PopupView
import SwiftUI

struct BoardGameView: View {
    let rows = [GridItem(.flexible())]
    @State private var isShownsheet = false
    @State private var isApplication = false
    @State private var isAlert = false
    @Environment(\.dismiss) var dismiss

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

                    LazyHGrid(rows: rows) {
                        ForEach(0 ..< 3) { _ in
                            Button {
                                self.isShownsheet.toggle()
                            } label: {
                                reservationGrid(backColor: .white, itemColor: .S30, name: "개최자 : 1206 류지민", status: "남은 자리 2개", isShownSheet: isShownsheet)
                            }
                            .sheet(isPresented: $isShownsheet) {
                                reservationList()
                                    .presentationDetents([.height(300)])
                            }
                        }
                    }

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
        }
    }

    @ViewBuilder
    func reservationGrid(backColor: Color, itemColor: Color, name: String, status: String, isShownSheet: Bool) -> some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 13)
                    .foregroundStyle(backColor)
                    .frame(width: 112, height: 140)
                    .shadow(color: Color("Shadow"), radius: 15, y: -7)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(isShownSheet ? Color.S30 : .white, lineWidth: 1)
                    )
                VStack(spacing: 0) {
                    Image(systemName: "dice.fill")
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
    func reservationList() -> some View {
        ZStack {
            Color.BG.ignoresSafeArea()
            VStack(spacing: 0) {
                Text("2023.10.10 점심시간")
                    .font(.custom("AppleSDGothicNeoB00", size: 20))
                    .padding(.top, 26)

                Text("개최자 : 1206 류지민")
                    .font(.custom("AppleSDGothicNeoEB00", size: 15))
                    .foregroundStyle(Color.S30)
                    .padding(.top, 32)

                Text("참가자 : 1114 이승화 , 1301 김동학, 1314 서지완, 1413 이현준, 1417 한재형")
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
