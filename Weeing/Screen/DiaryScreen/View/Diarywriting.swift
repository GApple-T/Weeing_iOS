//
//  Diarywriting.swift
//  Weeing
//
//  Created by 서지완 on 10/14/23.
//

import SwiftUI

struct Diarywriting: View {
    var body: some View {
        NavigationView {
            VStack{
                HStack {
                    VStack {
                        Text("일기 쓰기")
                            .font(Font.custom("AppleSDGothicNeoB00", size: 22))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                    }
                    
                    Spacer()
                    
                    Text("완료")
                        .font(.custom("AppleSDGothicNeoB00", size: 18))
                        .padding(.trailing, 27)
                        .foregroundStyle(Color.P30)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                Spacer()
            }
        }
    }
}



struct DiarywrigingView_Previews: PreviewProvider {
    static var previews: some View {
        Diarywriting()
    }
}
