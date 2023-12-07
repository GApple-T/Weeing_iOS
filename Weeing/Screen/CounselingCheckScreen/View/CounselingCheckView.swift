//
//  CounselingCheckView.swift
//  Weeing
//
//  Created by 서지완 on 12/5/23..
//

import SwiftUI

struct CounselingCheckView: View {
    @State private var toggleColor = [true, true]

    var body: some View {
        ZStack {
            Color.BG.ignoresSafeArea()
            VStack(spacing: 0) {
                Text("상담확인서")
                    .font(.custom("AppleSDGothicNeoB00", size: 22))
                    .padding(.bottom, 20)

                ScrollView {
                    ForEach(0 ..< 2, id: \.self) { index in
                        CheckView(toggleColors: $toggleColor, count: index)
                    }
                }
            }
        }
    }
}

struct CheckView: View {
    @Binding var toggleColors: [Bool]
    var count: Int

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 360, height: 260)
                .foregroundStyle(.white)
                .shadow(color: Color("Shadow"), radius: 8, x: 3, y: 2)
            HStack {
                VStack(alignment: .leading) {
                    Text("1314 서지완")
                        .font(.custom("AppleSDGothicNeoB00", size: 20))
                        .padding(.top, 18)
                        .padding(.bottom, 8)

                    Text("상담일시 : 2023년 11월 21일 (7교시)")
                        .font(.custom("AppleSDGothicNeoSB00", size: 14))
                        .padding(.bottom, 10)
                        .foregroundStyle(Color.S20)

                    Text("위 학생은 상기 시간에 상담실에서 상담을\n실시할 예정이오니 출석처리가 될 수 있도록\n협조하여 주시기 바랍니다.")
                        .font(.custom("AppleSDGothicNeoL00", size: 16))
                        .padding(.bottom, 8)

                    Text("상담자 : 김화홍")
                        .font(.custom("AppleSDGothicNeoM00", size: 15))
                        .padding(.bottom, 48)

                    HStack {
                        Text("교과선생님 확인란 : 임성은")
                            .font(.custom("AppleSDGothicNeoR00", size: 16))
                            .padding(.leading, 123)

                        Button(action: {
                            self.toggleColors[self.count].toggle()
                        }) {
                            RoundedRectangle(cornerRadius: 3)
                                .frame(width: 18, height: 18)
                                .foregroundStyle(self.toggleColors[self.count] ? Color.white : Color.P30)
                                .background(
                                    RoundedRectangle(cornerRadius: 3)
                                        .stroke(self.toggleColors[self.count] ? Color.gray : Color.P30, lineWidth: 2)
                                )
                                .overlay(
                                    Image(systemName: "checkmark")
                                        .resizable()
                                        .frame(width: 12, height: 9)
                                        .foregroundStyle(.white)
                                )
                        }
                    }
                    Spacer()
                }.padding(.leading, 40)
                Spacer()
            }
        }.padding(.top, 12)
    }
}

#Preview {
    CounselingCheckView()
}
