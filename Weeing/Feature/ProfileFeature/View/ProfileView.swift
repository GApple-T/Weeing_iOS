//
//  ProfileView.swift
//  Weeing
//
//  Created by 한재형 on 2023/09/04.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                Color.BG.ignoresSafeArea()
                VStack(spacing: 0) {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 75, height: 75)
                        .padding(.top, 52)
                    Text((UserDefaults.standard.string(forKey: "number") ?? UserDefaults.standard.string(forKey: "number2")) ?? "")
                        .font(.custom("AppleSDGothicNeoEB00", size: 20))
                        .padding(.bottom, 22)
                        .padding(.top, 7)
                    ScrollView {
                        ForEach(viewModel.diary) { diary in
                            diarylist(title: diary.title)
                        }
                    }
                    Spacer()
                }
                .onAppear(perform: {
                    viewModel.getDiary()
                })
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu(content: {
                        Button {} label: {
                            Text("팀 GApple notion 보러 가기")
                        }
                        Button(role: .destructive) {} label: {
                            Text("로그아웃")
                        }
                        Button(role: .destructive) {} label: {
                            Text("회원 탈퇴")
                        }
                    }, label: {
                        Image(systemName: "ellipsis")
                            .foregroundStyle(.black)
                            .rotationEffect(.degrees(-90))
                    })
                }
            }
        }
    }

    @ViewBuilder func diarylist(title: String) -> some View {
        NavigationLink {
            DiaryLog()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 360, height: 70)
                    .foregroundStyle(.white)
                    .shadow(color: .Shadow, radius: 15, x: 3, y: 2)
                HStack(spacing: 0) {
                    Group {
                        Text(title)
                            .font(Font.custom("AppleSDGothicNeoSB00", size: 18))
                            .foregroundStyle(.black)
                        Text((UserDefaults.standard.string(forKey: "number") ?? UserDefaults.standard.string(forKey: "number2")) ?? "")
                            .font(Font.custom("AppleSDGothicNeoM00", size: 12))
                            .foregroundStyle(.gray)
                            .padding(.leading, -15)
                    }
                    .padding(.leading, 30)
                    Spacer()
                    VStack(spacing: 0) {
                        Spacer()
                        Text("작성일 : 2023.10.10")
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
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
