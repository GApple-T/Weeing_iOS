//  ConsultLogView.swift
//  Weeing
//
//  Created by 서지완 on 2023/09/26.
//

import SwiftUI
import PopupView

struct DiaryView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.BG.ignoresSafeArea()
                VStack {
                    HStack {
                        Text("공유일기")
                            .font(.custom("AppleSDGothicNeoB00", size: 24))
                            .padding(.leading, 20)
                            .padding(.bottom,20)
                            Spacer()
                    }
                    ScrollView {
                        ForEach(0 ..< 12) { _ in
                            diarylog()
                        }
                    }
                }
                Button{
                }label: {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            ZStack{
                                Rectangle()
                                    .frame(width: 50, height: 50)
                                    .padding(.bottom, 15)
                                    .foregroundStyle(.white)
                                
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                    .padding(.trailing, 15)
                                    .padding(.bottom, 15)
                                    .foregroundStyle(Color.S40)
                                
                            }
                        }
                    }
                }
                
            }
        }
    }
}


struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView()
    }
}

@ViewBuilder func diarylog() -> some View {
    Button{

    }label: {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .shadow(color: .Shadow, radius: 15, x: 3, y: 2)
                .frame(width: 360, height: 70)
                .foregroundStyle(.white)

            HStack(spacing: 0){
                Group{
                    Text("야구장 가는 날")
                        .font(Font.custom("AppleSDGothicNeoSB00", size: 18))
                        .foregroundStyle(.black)
                    Text("1314 서지완")
                        .font(Font.custom("AppleSDGothicNeoM00", size: 12))
                        .foregroundStyle(.gray)
                        .padding(.leading, -15)
                }
                .padding(.leading, 30)
                Spacer()
                VStack(spacing: 0){
                    Spacer()
                    Text("작성일 : 2023.10.12")
                        .font(Font.custom("AppleSDGothicNeoM00", size: 12))
                        .foregroundStyle(.gray)
                        .padding(.trailing, 26)
                        .padding(.bottom, 6)
                }
                .frame(height: 70)
            }
        }
    }
}
