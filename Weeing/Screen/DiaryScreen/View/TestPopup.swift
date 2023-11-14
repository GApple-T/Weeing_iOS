//
//  TestPopup.swift
//  Weeing
//
//  Created by 서지완 on 11/8/23.
//
import SwiftUI

struct TestPopup: View {
    var body: some View {
        NavigationView {
            ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .frame(width: 320, height: 340)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 0.2)
                        )
                VStack{
                    Image("popupimg")
                        .resizable()
                        .frame(width: 198,height: 132)
                        .padding(.top,225)
                    
                    
                    Text("당신은 소중한 사람입니다.")
                        .font(.custom("AppleSDGothicNeoSB00", size: 14))
                        .frame(height: 22)
                    
                    Text("당신은 그 존재만으로도 아름답고 가치있는 사람입니다. 포기하지마세요!")
                        .font(.custom("AppleSDGothicNeoSB00", size: 10))
                        .foregroundStyle(Color.N30)
                    
                    Link(destination: URL(string: "https://www.lifeline.or.kr/")!) {
                        HStack(spacing: 0){
                            Text("한국생명의전화  ")
                                .font(Font.custom("AppleSDGothicNeoSB00", size: 12))
                                .foregroundStyle(Color.N10)
                                .frame(height: 22)
                            
                            Image(systemName: "chevron.right")
                                .foregroundStyle(Color.N10)
                            
                            
                        }
                        
                    }
                    Link(destination: URL(string: "https://www.cyber1388.kr:447/")!) {
                                   HStack (spacing: 0){
                                       Text("청소년사이버상담센터  ")
                                           .font(Font.custom("AppleSDGothicNeoSB00", size: 12))
                                           .foregroundStyle(Color.N10)
                                           .frame(height: 22)
                                           .padding(.top, 4)

                                       Image(systemName: "chevron.right")
                                           .foregroundStyle(Color.N10)
                                           .padding(.top, 4)
                                   }
                               }
                    Button{
                        guard let phoneURL = URL(string: "tel://109") else { return }
                        UIApplication.shared.open(phoneURL)
                    }label: {
                        HStack(spacing: 0){
                            Text("자살예방 상담전화는")
                                .font(Font.custom("AppleSDGothicNeoEB00", size: 12))
                                .foregroundStyle(Color.black)
                                .frame(height: 22)
                                .padding(.top,5)
                            
                            Text(" 109")
                                .font(Font.custom("AppleSDGothicNeoEB00", size: 12))
                                .foregroundStyle(Color.P30)
                                .frame(height: 22)
                                .padding(.top,5)
                            
                            
                        }
                    }
                    
                    
                    Rectangle()
                        .frame(width: 320,height: 0.2)
                    
                    
                    Button {
                    } label: {
                        Text("확인")
                            .font(.custom("AppleSDGothicNeoSB00", size: 15))
                            .foregroundStyle(.black)
                            .frame(width: 293)
                            .padding(.top,6)
                        
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    TestPopup()
}
