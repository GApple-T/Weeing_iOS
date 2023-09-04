//
//  MainView.swift
//  Weeing
//
//  Created by 한재형 on 2023/09/04.
//

import SwiftUI

struct MainView: View {
    @State var date = Date()
    var body: some View {
        ZStack{
            Color.backgroundColor.ignoresSafeArea()
            VStack{
                HStack{
                    Text("Weeing")
                        .font(Font.custom("Nunito-Black", size: 40))
                        .foregroundColor(Color("loginColor"))
                        .padding(.leading, 30)
                    Spacer()
                }
                Image("Wee")
                    .resizable()
                    .frame(width: 360, height: 240)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .inset(by: 0.5)
                            .stroke(Color("loginColor"), lineWidth: 1)
                    )
                    .padding(.bottom, 23)

                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(Color("loginTextFieldColor"))
                        .frame(width: 360, height: 360)
                    DatePicker(
                        "DatePicker",
                        selection: $date,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.graphical)
                    .background(Color("loginTextFieldColor"))
                    .cornerRadius(8)
                    .frame(width: 340, height: 340)
                    .accentColor(.orange)
                }
                
                Spacer()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
