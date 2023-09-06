//
//  MainView.swift
//  Weeing
//
//  Created by 한재형 on 2023/09/04.
//

import SwiftUI

struct HomeView: View {
    @State var date = Date()
    var body: some View {
        NavigationView{
            ZStack{
                Color.backgroundColor.ignoresSafeArea()
                VStack(spacing: 0){
                    HStack{
                        Text("Weeing")
                            .font(.custom("Nunito-Black", size: 30))
                            .foregroundColor(Color.loginColor)
                        Spacer()
                    }
                    .padding(.leading, 33)
                    .padding(.bottom, 17)
                    
                    Image("Wee")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 360, height: 240)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .inset(by: 0.5)
                                .stroke(Color.loginColor, lineWidth: 1)
                        )
                        .overlay(alignment: .bottomTrailing) {
                            Text("1 / 1")
                                .font(.system(size: 10))
                                .background {
                                    Rectangle()
                                        .padding(.vertical, 2)
                                        .padding(.horizontal)
                                        .foregroundColor(.clear)
                                        .background(.black.opacity(0.3))
                                        .cornerRadius(10)
                                }
                                .padding([.bottom, .trailing], 13)
                        }
                        .padding(.bottom, 30)
                        .padding(.horizontal, 15)
                            
                    ZStack{
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(Color.loginTextFieldColor)
                            .frame(width: 360, height: 360)
                            .aspectRatio(contentMode: .fit)
                        DatePicker(
                            "DatePicker",
                            selection: $date,
                            displayedComponents: [.date]
                        )
                        .background(Color.loginTextFieldColor)
                        .frame(width: 350, height: 350)
                        .aspectRatio(contentMode: .fit)
                        .datePickerStyle(.graphical)
                        .accentColor(.orange)
                    }
                        
                        
                    
                    Spacer()
                    
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
