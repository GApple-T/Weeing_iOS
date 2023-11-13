//  ConsultLogView.swift
//  Weeing
//
import SwiftUI
import PopupView

struct DiaryView: View {
    @State private var selectedButton1: Int? = nil
    @State private var selectedButton2: Int? = nil

    var body: some View {
        NavigationStack {
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    Color.BG.ignoresSafeArea()
                    VStack {
                        HStack{
                            Text("공유일기")
                                .font(Font.custom("AppleSDGothicNeoB00", size: 24))
                                .padding(.leading, 20)
                            Spacer()
                        }
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                Entire(isSelected: selectedButton1 == nil)
                                    .onTapGesture {
                                        selectedButton1 = nil
                                    }

                                ForEach(1..<4) { group1 in
                                    HScrollView(HNum1: group1, isSelected1: selectedButton1 == group1)
                                        .onTapGesture {
                                            selectedButton1 = group1
                                        }
                                }

                                ForEach(1..<5) { class1 in
                                    Class(HLabel: class1, isSelected2: selectedButton2 == class1)
                                        .onTapGesture {
                                            selectedButton1 = 0
                                            selectedButton2 = class1
                                        }
                                }
                            }
                        }
                        .padding(.top, 4)
                        .padding(.leading, 20)

                        ScrollView(showsIndicators: false) {
                            ForEach(0..<12) { _ in
                                diarylog()
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
}


@ViewBuilder
func HScrollView(HNum1: Int, isSelected1: Bool) -> some View {
    ZStack {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 51, height: 32)
            .foregroundColor(isSelected1 ? Color.P30 : Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )

        Text("\(HNum1)학년")
            .foregroundColor(isSelected1 ? Color.white : Color.black)
            .font(.system(size: 12))
    }
}

@ViewBuilder
func Entire(isSelected: Bool) -> some View {
    ZStack {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 45, height: 32)
            .foregroundColor(isSelected ? Color.P30 : Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 0.2)
            )

        Text("전체")
            .foregroundColor(isSelected ? Color.white : Color.black)
            .font(.system(size: 12).bold())
    }
}

@ViewBuilder
func Class(HLabel: Int,isSelected2: Bool) -> some View {
    ZStack {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 69, height: 32)
            .foregroundColor(isSelected2 ? Color.P30 : Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 0.2)
            )

        Text("1학년\(HLabel)반")
            .foregroundColor(isSelected2 ? Color.white : Color.black)
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
