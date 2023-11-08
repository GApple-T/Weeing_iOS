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
    @State private var textNum = 0
    
    
    var body: some View {
        ZStack {
            Color.BG.ignoresSafeArea()
        
            ZStack {
                /*VStack{
                        Text("일기 쓰기")
                            .font(Font.custom("AppleSDGothicNeoB00", size: 22))
                    Spacer()
                }.padding(.bottom,-30)*/
                    
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .frame(width: 350, height: 512)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 0.2)
                    )
                    .padding(.bottom, 174)
                    .padding(.top, 42)

               /* VStack {
                    ZStack(alignment: .leading){
                        if DiaryTitle.isEmpty{
                            Text("일기 제목을 입력해주세요 (최대 20글자)")
                                .font(.custom("AppleSDGothicNeoSB00", size: 16))
                                .foregroundStyle(Color.N10)
                        }
                        TextField("", text: $DiaryTitle)
                    }
                        .font(.custom("AppleSDGothicNeoSB00", size: 16))
                        .padding(.top, 138)
                        .padding(.leading, 36)
                    
                    Spacer()
                }*/
                /*VStack{
                    Divider()
                        .frame(width: 350)
                }.padding(.bottom,561)*/
                VStack{
                    
                    ZStack(alignment: .leading) {
                        if DiaryTitle.isEmpty{
                            Text("일기 제목을 입력해주세요 (최대 20글자)")
                                .font(.custom("AppleSDGothicNeoSB00", size: 16))
                                .foregroundStyle(Color.N10)
                        }
                        TextField("", text: $DiaryTitle)
                    }
                    Spacer()
                       
                }.padding(.top, 56)
                    .padding(.leading,36)
                VStack{
                    Divider()
                        .frame(width: 350)
                    Spacer()
                }.padding(.top,92)
                
                /*VStack{
                    let placeholder = "오늘은 어떤 하루 였나요?\n공유하고 싶은 이야기를 마음껏 작성해주세요."
                    
                    TextEditor(text: $DiaryContent)
                        .frame(width: 318,height: 260)
                        .font(.custom("AppleSDGothicNeoB00", size: 14))
                        .padding(.top,135)
                        .onChange(of: DiaryContent) { newText in
                            // 텍스트가 변경될 때 호출되는 클로저
                            textNum = newText.count // 글자 수를 저장
                        }
                    
                    
                    HStack{
                        if DiaryContent.isEmpty {
                            Text(placeholder)
                                .font(.system(size: 14))
                                .foregroundStyle(Color.N10)
                                .padding(.leading,36)
                            Spacer()
                        }
                        
                    }
                    Spacer()
                }*/
                
                VStack {
                    TextEditor(text: $DiaryContent)
                        .frame(width: 318, height: 400)
                        .font(.custom("AppleSDGothicNeoB00", size: 14))
                        .onChange(of: DiaryContent) { newText in
                            if newText.count > 500 {
                                // 텍스트가 500자를 초과하면 500자로 제한
                                DiaryContent = String(newText.prefix(500))
                            }
                            textNum = newText.count // 글자 수를 저장
                        }
                        .border(Color.gray)
                    Spacer()
                }.padding(.top, 95)

                if DiaryContent.isEmpty {
                    ZStack{
                        let placeholder = "오늘은 어떤 하루 였나요?\n공유하고 싶은 이야기를 마음껏 작성해주세요."
                        HStack{
                            VStack{
                                Text(placeholder)
                                    .font(.custom("Pretendard", size: 14))
                                    .foregroundStyle(Color.N20)
                                Spacer()
                            }.padding(.top,100)
                            Spacer()
                        }.padding(.leading,36)
                    }
                }
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Text("\(textNum) / 500")
                            .foregroundStyle(Color.N20)
                            .font(.system(size: 14))
                            
                        
                    }.padding(.trailing,32)
                    
                }.padding(.bottom,190)

            }
        }
        //.navigationTitle("일기 쓰기")
        .toolbar {
            
            ToolbarItem(placement: .topBarTrailing) {
                HStack{
                    
                    Text("일기 쓰기")
                        .font(Font.custom("AppleSDGothicNeoB00", size: 22))
                        .padding(.trailing,84)
                    Button {
                        dismiss()
                    } label: {
                        Text("완료")
                            .font(.custom("AppleSDGothicNeoB00", size: 18))
                            .foregroundStyle(Color.P30)
                            .padding(.trailing,7)
                    }
                }
            }
        }
        //.navigationBarTitleDisplayMode(.inline)
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
