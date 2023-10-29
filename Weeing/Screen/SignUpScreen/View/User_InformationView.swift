//
//  User_InformationView.swift
//  Weeing
//
//  Created by 이승화 on 2023/08/25.
//

import SwiftUI

enum userInfo: Hashable {
    case name
    case studentID
}

struct User_InformationView: View {
    @State private var textName = ""
    @State private var textStudentID = ""
    @FocusState private var focusedField: userInfo?

    var body: some View {
        ZStack {
            Color.BG.ignoresSafeArea()
            VStack(spacing: 0) {
                Text("Weeing")
                    .font(.custom("Nunito-Black", size: 45))
                    .foregroundColor(.P30)
                    .padding(.top, 109)

                Text("학번")
                    .foregroundColor(.N10)
                    .font(.custom("AppleSDGothicNeoB00", size: 14))
                    .padding(.top, 65)
                    .padding(.leading, 52)
                    .padding(.trailing, 314)
                    .focused($focusedField, equals: .studentID)
                    .submitLabel(.done)

                Rectangle()
                    .cornerRadius(10)
                    .frame(height: 40)
                    .padding(.horizontal, 45)
                    .padding(.top, 4)
                    .foregroundColor(.S10)
                    .overlay(
                        TextField("학번을 입력해주세요", text: $textStudentID)
                            .font(.custom("AppleSDGothicNeoM00", size: 12))
                            .padding(.leading, 55)
                            .padding(.trailing, 113)
                    )

                Text("이름")
                    .foregroundColor(.N10)
                    .font(.custom("AppleSDGothicNeoB00", size: 14))
                    .padding(.leading, 52)
                    .padding(.trailing, 314)
                    .padding(.top, 24)

                Rectangle()
                    .cornerRadius(10)
                    .frame(height: 40)
                    .padding(.horizontal, 45)
                    .padding(.top, 4)
                    .foregroundColor(.S10)
                    .overlay(
                        TextField("이름을 입력해주세요", text: $textName)
                            .font(.custom("AppleSDGothicNeoM00", size: 12))
                            .padding(.leading, 55)
                            .padding(.trailing, 45)
                            .focused($focusedField, equals: .name)
                            .onSubmit {
                                focusedField = .studentID
                            }
                    )

                startPageButton(buttonText: "확인", buttonColor: .P30)
                    .padding(.top, 44)

                Spacer()
            }
        }
    }
}

struct User_InformationView_Previews: PreviewProvider {
    static var previews: some View {
        User_InformationView()
    }
}
