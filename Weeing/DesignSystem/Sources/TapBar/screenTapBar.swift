//
//  screenTapBar.swift
//  Weeing
//
//  Created by 한재형 on 2023/09/04.
//

import SwiftUI

public struct screenTapBar: View {
@State private var selectedIndex = 0
let tabBarImangeNames = ["gamecontroller.fill", "book.fill", "house.fill", "calendar", "person.crop.circle.fill"]
    var selected = 0
    public var body: some View {
        VStack{
            ZStack {
                switch selectedIndex {
                case 0:
                    BoardGameView()
                case 1:
                    DiaryView()
                case 2:
                    HomeView()
                case 3:
                    ConsultationView()
                default:
                    ProfileView()
                }
            }
            Spacer()
            HStack{
            Spacer()
            ForEach(0..<tabBarImangeNames.count){ num in
                VStack {
                    Image(systemName: tabBarImangeNames[num])
                        .font(.system(size: 26, weight: .light))
                        .foregroundColor(selectedIndex == num ? Color.joinColor : Color(.white))
                        .padding(.top, 5)
                        .padding(.bottom, -10)
                }
                .gesture(
                    TapGesture()
                        .onEnded { _ in
                            selectedIndex = num
                        }
                )
                Spacer()
                }
            }
        }
        .background(Color.loginColor)
    }
}
