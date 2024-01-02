import PopupView
//  ConsultLogView.swift
//  Weeing
//
import SwiftUI

struct DiaryView: View {
    @State private var GradeSelectButton: Int? = nil
    @State private var ClassSelectButton: Int? = nil
    @State private var AllSelectBotton: Bool = false

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
                                    ClassSelectButton = nil
                                }

                            ForEach(1 ..< 4) { GradeFor in
                                GradeFillterButton(GradeChange: GradeFor, GradeButtonColor: GradeSelectButton == GradeFor)
                                    .onTapGesture {
                                        GradeSelectButton = GradeFor
                                        ClassSelectButton = nil
                                        AllSelectBotton = false
                                    }
                            }

                            ForEach(1 ..< 5) { ClassFor in
                                ClassFillterButton(ClassChange: ClassFor, ClassButtonColor: ClassSelectButton == ClassFor)
                                    .onTapGesture {
                                        GradeSelectButton = nil
                                        ClassSelectButton = ClassFor
                                        AllSelectBotton = false
                                    }
                            }
                        }
                    }
                    .padding(.top, 4)
                    .padding(.leading, 20)

                    ScrollView(showsIndicators: false) {
                        ForEach(0 ..< 12) { _ in
//                            diarylog()
                        }
                        .padding(.top, 14)
                    }
                    .padding(.top, 10)
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
            }
        }
    }
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

@ViewBuilder
func diarylog() -> some View {
    NavigationLink {
        DiaryLog()
    } label: {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .shadow(color: .Shadow, radius: 12.5, x: 3, y: 2)
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
