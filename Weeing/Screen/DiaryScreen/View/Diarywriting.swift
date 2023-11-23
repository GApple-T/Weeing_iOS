
//
//  Diarywriting.swift
//  Weeing
//
//  Created by 서지완 on 10/14/23.
//
import SwiftUI

struct Diarywriting: View {
    enum FocusText {
        case DiaryTitle, DiaryContent
    }

    @State private var diaryTitleText = ""
    @State private var diaryContentText = ""
    @FocusState private var focusField: FocusText?
    @State private var DiaryTitle = ""
    @State private var DiaryContent = ""
    @Environment(\.dismiss) var dismiss
    @State private var textNum = 0
    @State private var keyboardHeight: CGFloat = 0

    enum Field {
        case DiaryTitle
        case DiaryContent
    }

    var body: some View {
        ZStack {
            Color.BG.ignoresSafeArea()
            ScrollView {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(Color.white)
                        .frame(width: 350, height: 512)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 0.2)
                        )
                        .padding(.bottom, 174)
                        .padding(.top, 42)

                    VStack {
                        ZStack(alignment: .leading) {
                            if diaryTitleText.isEmpty {
                                Text("일기 제목을 입력해주세요")
                                    .font(.custom("AppleSDGothicNeoSB00", size: 16))
                                    .foregroundStyle(Color.gray)
                            }
                            TextField("", text: $diaryTitleText)
                                .font(.custom("AppleSDGothicNeoSB00", size: 16))
                                .onTapGesture {
                                    focusField = .DiaryTitle
                                }
                        }
                        .padding(.leading, 36)

                        Divider()
                            .frame(width: 350)

                        ZStack(alignment: .leading) {
                            let placeholder = "오늘은 어떤 하루 였나요?\n공유하고 싶은 이야기를 마음껏 작성해주세요."

                            TextEditor(text: $diaryContentText)
                                .frame(width: 318, height: 400)
                                .font(.custom("AppleSDGothicNeoM00", size: 15))
                                .onTapGesture {
                                    focusField = .DiaryContent
                                }
                                .padding(.trailing, 5)
                                .overlay(
                                    VStack {
                                        Text(placeholder)
                                            .font(.custom("AppleSDGothicNeoSB00", size: 14))
                                            .foregroundStyle(Color.gray)
                                            .opacity(diaryContentText.isEmpty ? 1.0 : 0.0)

                                        Spacer()
                                    }.padding(.top, 8)
                                        .padding(.trailing, 68)
                                )
                        }
                    }
                    .padding(.bottom, 175)

                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Text("\(textNum) / 500")
                                .foregroundStyle(Color.gray)
                                .font(.system(size: 14))
                        }
                        .padding(.trailing, 32)
                    }
                    .padding(.bottom, 190)
                }
            }
        }.toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                HStack {
                    Text("일기 쓰기")
                        .font(.custom("AppleSDGothicNeoB00", size: 22))
                        .padding(.trailing, 84)
                    Button {
                        dismiss()
                    } label: {
                        Text("완료")
                            .font(.custom("AppleSDGothicNeoB00", size: 18))
                            .foregroundStyle(Color.P30)
                            .padding(.trailing, 7)
                    }
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Diarywriting()
}
