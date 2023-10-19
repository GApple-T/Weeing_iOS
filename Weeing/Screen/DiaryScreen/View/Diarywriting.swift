//
//  Diarywriting.swift
//  Weeing
//
//  Created by 서지완 on 10/14/23.
//

import SwiftUI

struct Diarywriting: View {
    @State private var DiaryTitle = ""
    @State private var DiaryContent = ""
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        ZStack {
            Color.BG.ignoresSafeArea()
            VStack(spacing: 0){
                
                let placeholder = "오늘은 어떤 하루 였나요?\n공유하고 싶은 이야기를 마음껏 작성해주세요."
                TextField("일기 제목을 입력해주세요 (최대 20글자)", text: $DiaryTitle)
                    .font(.custom("AppleSDGothicNeoSB00", size: 18))
                    .padding(.top, 30)
                    .foregroundStyle(Color.black)
                    .padding(.leading,56)
                
                Rectangle()
                    .frame(width: 330,height: 1)
                
                
                ZStack(alignment: .topLeading) {
                    TextEditor(text: $DiaryContent)
                        .background(Color.BG)
                        .font(.custom("AppleSDGothicNeoB00", size: 15))
                        .frame(width: 330)
                        .colorMultiply(.BG)
                        .padding(.top,10)
                    
                    
                    if DiaryContent.isEmpty {
                        Text(placeholder)
                            .font(.custom("AppleSDGothicNeoSB00", size: 15))
                            .foregroundStyle(Color.Textholder)
                            .padding(.top, 18)
                            .padding(.leading, 6)
                    }
                }
            }
        }
        .navigationTitle("일기 쓰기")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    dismiss()
                } label: {
                    Text("완료")
                        .font(.custom("AppleSDGothicNeoB00", size: 18))
                        .foregroundStyle(Color.P30)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }
}

struct Diarywriting_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Diarywriting()
        }
    }
}
