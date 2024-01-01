//
//  MainView.swift
//  Weeing
//
//  Created by 한재형 on 2023/09/04.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ScreenTapBar()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct ScreenTapBar: View {
    @State private var selectedIndex = 2
    let tabBarImangeNames = ["gamecontroller.fill", "book.fill", "house.fill", "calendar", "person.crop.circle.fill"]
    @State private var selectedConsultLog = UUID()
    var selected = 0
    var body: some View {
        VStack {
            ZStack {
                switch selectedIndex {
                case 0:
                    BoardGameView()
                case 1:
                    DiaryView()
                case 2:
                    HomeView(viewModel: HomeViewModel())
                case 3:
                    ConsultLogView(selectedConsultLog: $selectedConsultLog)
                default:
                    ProfileView()
                }
            }
            Spacer()
            VStack(spacing: 0) {
                Divider()
                    .background(Color.black)
                    .padding(.top, -8)
                HStack(spacing: 0) {
                    Spacer()
                    ForEach(0 ..< tabBarImangeNames.count) { num in
                        VStack {
                            Image(systemName: tabBarImangeNames[num])
                                .font(.system(size: 24, weight: .light))
                                .foregroundColor(selectedIndex == num ? Color.S20 : Color.S10)
                                .padding(.top, 5)
                                .padding(.bottom, -11)
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
        }
        .background(Color.BG)
    }
}
