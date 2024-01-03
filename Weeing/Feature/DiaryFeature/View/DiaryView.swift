import PopupView
import SwiftUI

struct DiaryView: View {
    @State private var GradeSelectButton: Int? = nil
    @State private var AllSelectBotton: Bool = false
    @ObservedObject var viewModel = DiaryListViewModel()
    @State private var text1: String = ""
    @State private var text2: String = ""
    @State private var textNum = 0
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                Color.BG.ignoresSafeArea()
                VStack {
                    HStack {
                        Text("공유일기")
                            .font(.custom("AppleSDGothicNeoB00", size: 24))
                            .padding(.leading, 20)
                        Spacer()
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            EntireFillterButton(EntireButtonColor: AllSelectBotton)
                                .onTapGesture {
                                    AllSelectBotton.toggle()
                                    GradeSelectButton = nil
                                    viewModel.loadConsultLogs(button: nil)
                                }

                            ForEach(1 ..< 4) { GradeFor in
                                GradeFillterButton(GradeChange: GradeFor, GradeButtonColor: GradeSelectButton == GradeFor)
                                    .onTapGesture {
                                        GradeSelectButton = GradeFor
                                        AllSelectBotton = false
                                        viewModel.loadConsultLogs(button: GradeFor)
                                    }
                            }
                        }
                    }
                    .padding(.leading, 20)

                    ScrollView {
                        LazyVStack {
                            if viewModel.isDataLoaded {
                                ForEach(viewModel.diaries, id: \.id) { diarycount in
                                    NavigationLink(destination: diarycheck(title: diarycount.title,
                                                                           description: diarycount.description,
                                                                           textNum: textNum))
                                    {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .shadow(color: .Shadow, radius: 12.5, x: 3, y: 2)
                                                .frame(width: 360, height: 70)
                                                .foregroundStyle(.white)

                                            HStack(spacing: 0) {
                                                Group {
                                                    Text(diarycount.title)
                                                        .font(.custom("AppleSDGothicNeoSB00", size: 18))
                                                        .foregroundStyle(.black)
                                                    Text("1114 이승화")
                                                        .font(.custom("AppleSDGothicNeoM00", size: 12))
                                                        .foregroundStyle(.gray)
                                                        .padding(.leading, -15)
                                                }
                                                .padding(.leading, 30)
                                                Spacer()
                                                VStack(spacing: 0) {
                                                    Spacer()
                                                    Text("작성일 : 2024.01.02")
                                                        .font(.custom("AppleSDGothicNeoM00", size: 12))
                                                        .foregroundStyle(.gray)
                                                        .padding(.trailing, 26)
                                                        .padding(.bottom, 6)
                                                }
                                                .frame(height: 70)
                                            }
                                        }
                                    }
                                    .onTapGesture {
                                        text1 = diarycount.title
                                        text2 = diarycount.description
                                        textNum = text2.count
                                    }
                                }
                                .padding(.top, 14)
                            }
                        }
                    }
                }.navigationBarBackButtonHidden(true)
                    .padding(.top, 10)

                NavigationLink(
                    destination: Diarywriting())
                {
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
                .padding(.leading, 305)
                .padding(.trailing, 15)
                .padding(.bottom, 15)
            }
        }
    }

    @ViewBuilder
    func diarycheck(title: String, description: String, textNum: Int) -> some View {
        ZStack {
            Color.BG.ignoresSafeArea()

            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: 350, height: 512)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 0.2)
                )
                .padding(.bottom, 174)
                .padding(.top, 42)

            VStack(alignment: .leading) {
                Text(title)
                    .font(.custom("AppleSDGothicNeoSB00", size: 16))
                    .padding(.leading, 21)
                    .padding(.top, 56)

                Divider()
                    .frame(width: 350)

                Text(description)
                    .font(.custom("AppleSDGothicNeoM00", size: 15))
                    .padding(.horizontal, 21)
                    .padding(.top, 8)
                    .lineSpacing(8)

                Text("\(textNum) / 500")
                    .foregroundStyle(Color.N20)
                    .font(.system(size: 14))
                    .padding(.leading, 296)

                Spacer()
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                HStack {
                    NavigationLink(destination: DiaryView()) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color.S20)
                            .frame(width: 30, height: 30)
                            .padding(.leading, 7)
                    }

                    Text("2024.01.03 일기")
                        .font(.custom("AppleSDGothicNeoB00", size: 22))
                        .padding(.leading, 58)
                }
            }
            // .navigationBarBackButtonHidden(true)
        }.navigationBarBackButtonHidden(true)
    }

    @ViewBuilder
    func GradeFillterButton(GradeChange: Int, GradeButtonColor: Bool) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 51, height: 32)
                .foregroundStyle(GradeButtonColor ? Color.P30 : Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .inset(by: 0.5)
                        .stroke(GradeButtonColor ? Color.P30 : Color.N30, lineWidth: 1)
                        .foregroundStyle(GradeButtonColor ? Color.P30 : Color.white)
                )

            Text("\(GradeChange)학년")
                .foregroundStyle(GradeButtonColor ? Color.white : Color.black)
                .font(.system(size: 12))
        }
    }

    @ViewBuilder
    func EntireFillterButton(EntireButtonColor: Bool) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 45, height: 32)
                .foregroundStyle(EntireButtonColor ? Color.P30 : Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .inset(by: 0.5)
                        .stroke(EntireButtonColor ? Color.P30 : Color.N30, lineWidth: 1)
                        .foregroundStyle(EntireButtonColor ? Color.P30 : Color.white)
                )

            Text("전체")
                .foregroundStyle(EntireButtonColor ? Color.white : Color.black)
                .font(.system(size: 12).bold())
        }
    }

    @ViewBuilder
    func ClassFillterButton(ClassChange: Int, ClassButtonColor: Bool) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 70, height: 33)
                .foregroundStyle(ClassButtonColor ? Color.P30 : Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .inset(by: 0.5)
                        .stroke(ClassButtonColor ? Color.P30 : Color.N30, lineWidth: 1)
                )

            Text("1학년\(ClassChange)반")
                .foregroundStyle(ClassButtonColor ? Color.white : Color.black)
                .font(.system(size: 12))
        }
    }
}
