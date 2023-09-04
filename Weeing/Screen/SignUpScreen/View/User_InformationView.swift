//
//  User_ImformationView.swift
//  Weeing
//
//  Created by 이승화 on 2023/08/25.
//

import SwiftUI

struct User_InformationView: View {
    
    @State private var textName = ""
    @State private var textStudentID = ""
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            VStack {
                Text("Weeing")
                    .font(.custom("Nunito-Black", size: 45))
                    .foregroundColor(.loginColor)
                    .padding(.top,109)
                
                Text("이름")
                    .font(.custom("AppleSDGothicNeoB00", size: 14))
                    .padding(.leading,54)
                    .padding(.trailing,311)
                    .padding(.top,50)
                
                Rectangle()
                    .cornerRadius(10)
                    .frame(height:40)
                    .padding(.horizontal,50)
                    .foregroundColor(.loginTextFieldColor)
                    .overlay(
                        TextField("이름을 입력해주세요",text: $textName)
                            .font(.system(size:12))
                            .padding(.leading,64)
                            .padding(.trailing,45)
                    )
                
                Text("학번")
                    .font(.custom("AppleSDGothicNeoB00", size: 14))
                    .padding(.top,24)
                    .padding(.leading,54)
                    .padding(.trailing,311)
                
                Rectangle()
                    .cornerRadius(10)
                    .frame(height:40)
                    .padding(.horizontal,50)
                    .foregroundColor(.loginTextFieldColor)
                    .overlay(
                        TextField("학번을 입력해주세요",text: $textStudentID)
                            .font(.system(size:12))
                            .padding(.leading,64)
                            .padding(.trailing,45)
                    )
                
                startPageButton(buttonText: "확인", buttonColor: .joinColor)
                    .padding(.top,44)
                
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
