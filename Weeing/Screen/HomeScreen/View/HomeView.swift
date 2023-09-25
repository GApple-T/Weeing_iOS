//
//  MainView.swift
//  Weeing
//
//  Created by 한재형 on 2023/09/04.
//

import SwiftUI
import SwiftUICalendar

struct HomeView: View {
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.BG.ignoresSafeArea()
                VStack(spacing: 0){
                    HStack{
                        Text("Weeing")
                            .font(.custom("Nunito-Black", size: 30))
                            .foregroundColor(Color.P30)
                        Spacer()
                    }
                    .padding(.leading, 22)
                    .padding(.bottom, 10)
                    ScrollView(showsIndicators: false){
                        VStack(spacing: 0){
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color.N40)
                                    .frame(width: 360, height: 240)
                                Text("불편했던 위클래스 사용,\nWeeing으로\n편리하게 상담을 신청해보세요!")
                                    .padding(.trailing, 180)
                                    .padding(.bottom, 164)
                                    .padding(.top, 28)
                                    .padding(.leading, 27)
                                    .font(.custom("NotoSansKR-Bold", size: 14))
                                Image("Wee")
                                    .resizable()
                                    .shadow(color: Color(red: 0.44, green: 0.56, blue: 0.69).opacity(0.2), radius: 3, x: 7, y: 6)
                                    .frame(width: 180, height: 180)
                                    .padding(.leading, 158)
                                    .padding(.trailing, 22)
                                Text("1 / 1").font(.system(size: 10))
                                    .frame(width: 40, height: 14)
                                    .background(Color(.systemGray2))
                                    .cornerRadius(10)
                                    .padding(.leading, 306)
                                    .padding(.top, 216)
                                    .padding(.bottom, 10)
                                    .padding(.trailing, 14)
                            }
                            .padding(.bottom, 12)
                            
                            //캘린더
                            CalenderView()
                            HStack(spacing: 10){
                                VStack(spacing: 0){
                                    Text("상담 시간표")
                                        .font(.custom("AppleSDGothicNeoSB00", size: 15))
                                        .padding(.top, 10)
                                        .padding(.bottom, 10)
                                    HStack(spacing: 0) {
                                        VStack(spacing: 0){ // n교시
                                            ForEach(1...7, id: \.self){ i in
                                                Text("\(i)교시")
                                                    .font(.custom("AppleSDGothicNeoB00", size: 12))
                                                    .foregroundColor(Color.S40)
                                                    .padding(.bottom, 8)
                                                    .padding(.trailing, 16)
                                            }
                                        }
                                        Divider()
                                            .frame(height: 160)
                                            .background(Color.S20)
                                        VStack(spacing: 0){ // 상담 가능
                                            ForEach(1...7, id: \.self){ _ in
                                                Text("상담 가능")
                                                    .font(.custom("AppleSDGothicNeoB00", size: 12))
                                                    .foregroundColor(Color.N10)
                                                    .padding(.bottom, 8)
                                                    .padding(.leading, 16)
                                            }
                                        }
                                        Spacer()
                                    }
                                    .padding(.leading, 32)
                                    .padding(.bottom, 16)
                                }
                                .background(Color.SO5020)
                                .cornerRadius(5)
                                .frame(width: 175, height: 232)
                                
                                VStack(spacing: 0){
                                    Text("시간표")
                                        .font(.custom("AppleSDGothicNeoSB00", size: 15))
                                        .padding(.top, 10)
                                        .padding(.bottom, 10)
                                    HStack(spacing: 0) {
                                        VStack(spacing: 0){ // n교시
                                            ForEach(1...7, id: \.self){ i in
                                                Text("\(i)교시")
                                                    .font(.custom("AppleSDGothicNeoB00", size: 12))
                                                    .foregroundColor(Color.S40)
                                                    .padding(.bottom, 8)
                                                    .padding(.trailing, 16)
                                            }
                                        }
                                        Divider()
                                            .frame(height: 160)
                                            .background(Color.S20)
                                        VStack(spacing: 0){ // 상담 가능
                                            ForEach(1...7, id: \.self){ _ in
                                                Text("프로그래밍")
                                                    .font(.custom("AppleSDGothicNeoB00", size: 12))
                                                    .foregroundColor(Color.N10)
                                                    .padding(.bottom, 8)
                                                    .padding(.leading, 16)
                                            }
                                        }
                                        Spacer()
                                    }
                                    .padding(.leading, 28)
                                    .padding(.bottom, 16)
                                }
                                .background(Color.SO3015)
                                .cornerRadius(5)
                                .frame(width: 175, height: 232)
                            }
                            NavigationLink{
                                ConsultationView()
                            }label: {
                                Text("상담 예약")
                                    .font(.custom("AppleSDGothicNeoB00", size: 18))
                                    .foregroundColor(.white)
                                    .frame(width: 360, height: 54)
                                    .background(Color.P30)
                                    .cornerRadius(10)
                                    .padding(.top, 13)
                                    .padding(.bottom, 13)
                            }
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
