//
//  User_ImformationView.swift
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
                    .foregroundStyle(Color.P30)
                    .padding(.top,109)
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    Text("학번")
                        .foregroundStyle(Color.N10)
                        .font(.custom("AppleSDGothicNeoB00", size: 14))
                        .padding(.top,65)
                        .padding(.leading,52)
                        .padding(.trailing,314)
                        .focused($focusedField, equals: .studentID)
                        .submitLabel(.done)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .padding(.horizontal,45)
                        .foregroundStyle(Color.S10)
                        .padding(.top,4)
                        .overlay(
                            TextField("학번을 입력해주세요", text: $textStudentID)
                                .frame(height: 40)
                                .font(.custom("AppleSDGothicNeoM00", size: 12))
                                .padding(.leading,55)
                                .padding(.trailing,113)
                        )
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                    
                    Text("이름")
                        .foregroundStyle(Color.N10)
                        .font(.custom("AppleSDGothicNeoB00", size: 14))
                        .padding(.leading,52)
                        .padding(.trailing,314)
                        .padding(.top,24)
                    
                    Rectangle()
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .padding(.horizontal,45)
                        .padding(.top,4)
                        .foregroundStyle(Color.S10)
                        .overlay(
                            TextField("이름을 입력해주세요",text: $textName)
                                .font(.custom("AppleSDGothicNeoM00", size: 12))
                                .padding(.leading,55)
                                .padding(.trailing,45)
                                .focused($focusedField,equals: .name)
                                .onSubmit {
                                    focusedField = .studentID
                                }
                        )
                    
                    startPageButton(buttonText: "확인", buttonColor: .P30)
                        .padding(.top,44)
                    
                    Spacer()
                }
            }
        }
    }
}

struct User_InformationView_Previews: PreviewProvider {
    static var previews: some View {
        User_InformationView()
    }
}
