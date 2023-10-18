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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    var body: some View {
        ZStack {
            Color.BG.ignoresSafeArea()
            HStack {
                Spacer()
                VStack {
                    Text("일기 쓰기")
                        .font(.custom("AppleSDGothicNeoB00", size: 22))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.black)
                        .frame(width: 82, height: 22)
                    Spacer()
                }
                Spacer()
            }
            VStack {
                HStack {
                    Spacer()
                    VStack {
                        Button {
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            
                            Text("완료")
                                .font(.custom("AppleSDGothicNeoB00", size: 18))
                                .foregroundStyle(Color.P30)
                                .padding(.trailing, 27)
                            
                        }
                        Spacer()
                    }
                }
            }
            .padding(.leading, 27)
            .padding(.bottom, 15)
            VStack {
                
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
                    
                    
                    if DiaryContent.isEmpty {
                        Text(placeholder)
                            .font(.custom("AppleSDGothicNeoSB00", size: 15))
                            .foregroundStyle(Color.Textholder)
                            .padding(.top, 8)
                            .padding(.leading, 6)
                    }
                }
                
                
                
            }
            .padding(.top, 49)
            
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct Diarywriting_Previews: PreviewProvider {
    static var previews: some View {
        Diarywriting()
    }
}




