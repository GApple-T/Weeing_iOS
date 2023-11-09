//  ConsultLogView.swift
//  Weeing
//
import SwiftUI
import PopupView

struct DiaryView: View {
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                Color.BG.ignoresSafeArea()
                // 지완: 가로로 스크롤 되는부분 근데 살짝 존망느낌 내일 할꼬얌 / 11월 9일 23시 35분
                VStack{
                    HStack{
                        ScrollView(.horizontal){
                            ForEach(0..<3){ _ in
                                Rectangle()
                                    .frame(width: 50,height: 30)
                            }
                        }
                    }
                    Spacer()
                }
                VStack {
                    ScrollView {
                        ForEach(0 ..< 12) { _ in
                            diarylog()
                        }
                        .padding(.top, 10)
                    }
                }

                    NavigationLink(
                        destination: Diarywriting(),
                        label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 70, height: 70)
                                .foregroundStyle(Color.S40)
                                .background(
                                    Rectangle()
                                        .frame(width: 50, height: 50)
                                        .foregroundStyle(.white)
                                )
                        }
                    )
                    .padding(.leading, 305)
                    .padding(.trailing, 15)
                    .padding(.bottom, 15)
            }.navigationBarItems(leading: Text("공유일기")
            .font(.custom("AppleSDGothicNeoB00", size: 24)))
        }
    }
}


@ViewBuilder func diarylog() -> some View {
    NavigationLink {
        DiaryLog()
    } label: {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .shadow(color: .Shadow, radius: 15, x: 3, y: 2)
                .frame(width: 360, height: 70)
                .foregroundStyle(.white)

            HStack(spacing: 0) {
                Group {
                    Text("야구장 가는 날")
                        .font(.custom("AppleSDGothicNeoSB00", size: 18))
                        .foregroundStyle(.black)
                    Text("1314 서지완")
                        .font(.custom("AppleSDGothicNeoM00", size: 12))
                        .foregroundStyle(.gray)
                        .padding(.leading, -15)
                }
                .padding(.leading, 30)
                Spacer()
                VStack(spacing: 0) {
                    Spacer()
                    Text("작성일 : 2023.10.12")
                        .font(.custom("AppleSDGothicNeoM00", size: 12))
                        .foregroundStyle(.gray)
                        .padding(.trailing, 26)
                        .padding(.bottom, 6)
                }
                .frame(height: 70)
            }
        }
    }
}

#Preview {
    DiaryView()
}
