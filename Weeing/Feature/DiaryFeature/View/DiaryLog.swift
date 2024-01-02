//  DiaryLog.swift
//  Weeing
//
//  Created by 서지완 on 11/9/23.
//

import SwiftUI

struct DiaryLog: View {
    @Environment(\.dismiss) var dismiss
    @State private var textNum = 449
    @StateObject var viewModel = ProfileViewModel()
    var body: some View {
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
                Text("야구장 가는 날")
                    .font(.custom("AppleSDGothicNeoSB00", size: 16))
                    .padding(.leading, 36)
                    .padding(.top, 56)

                Divider()
                    .frame(width: 350)
                    .padding(.leading, 21)

                Text(viewModel.description)
                    .font(.custom("AppleSDGothicNeoM00", size: 15))
                    .padding(.horizontal, 36)
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
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    DiaryLog()
}
