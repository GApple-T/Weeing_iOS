//
//  DiaryLog.swift
//  Weeing
//
//  Created by 서지완 on 11/9/23.
//

import SwiftUI

struct DiaryLog: View {
    @Environment(\.dismiss) var dismiss
    @State private var textNum = 449
    var body: some View {
        ZStack{
            ZStack {
                Color.BG.ignoresSafeArea()
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .frame(width: 350, height: 512)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 0.2)
                    )
                    .padding(.bottom, 174)
                    .padding(.top, 42)
                
                VStack(alignment: .leading){
                    Text("야구장 가는 날")
                        .font(Font.custom("AppleSDGothicNeoSB00", size: 16))
                        .padding(.leading,16)
                        .padding(.top,56)
                    
                    
                    Divider()
                        .frame(width: 350)
                    
                    Text("오늘은 학교에서 야구장을 가는 날이다!! 저번에 우천 취소로 야구장을 가지 못하고 정말 슬펐는데 가을 야구 가기 전 마지막 경기를 보게 돼서 기분이 너무 좋다!! 물론 학교를 홍보하기 위해서 가는 것도 맞지만 학교 홍보도 하고 학생들도 즐기고 이게 바로 일석이조 아닌가!! 야구장을 가기 위해서 과잠도 입고 아침 일찍 일어나서 준비했다... 그리고 또 학생회 친구들은 직접 만든 피켓을 들고 홍보를 해야한다구 했다. 조금 웃기긴 하지만 학교를 홍보하기 위해서 못 할 건 없다!! 내년 후배들이 기대된다. 얼른 8기를 만나고 싶다! 곧 있으면 원서 접수가 시작되는데 이번 연도에는 더 많은 친구가 지원해 줬으면 좋겠다. 벌써 겨울이 기대된다. 물로 토익사관학교도 방과후도 쉽지 않겠지만 더 노력하면 되지 않겠냐고 생각한다. 물론 긍정적인 생각에도 한계가 있지만. 난 언젠가 정말로 괜찮아 질테니까 말이다!")
                        .font(.custom("AppleSDGothicNeoM00", size: 15))
                        .frame(width: 318)
                        .padding(.leading,16)
                        .padding(.top,8)
                        .lineSpacing(8)
                    
                    
                    Text("\(textNum) / 500")
                        .foregroundStyle(Color.N20)
                        .font(.system(size: 14))
                        .padding(.leading,276)
                        .padding(.top,3)
                    
                    Spacer()
                }
            }
        }.toolbar {
            
            ToolbarItem(placement: .topBarTrailing) {
                HStack{
                    
                    Text("일기 쓰기")
                        .font(.custom("AppleSDGothicNeoB00", size: 22))
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
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    DiaryLog()
}
