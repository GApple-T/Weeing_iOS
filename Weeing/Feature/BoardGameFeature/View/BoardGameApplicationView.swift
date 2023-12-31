//
//  BoardGameApplicationView.swift
//  Weeing
//
//  Created by 이승화 on 12/18/23.
//

import PopupView
import SwiftUI

struct BoardGameApplicationView: View {
    @State var isClicked = false
    @State var selectionTitle = "인원수를 선택하세요."
    @State var maxOf = 0
    @State var isSelect = false
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel = BoardGameViewModel()

    var body: some View {
        ZStack {
            Color.BG.ignoresSafeArea()
            VStack(spacing: 0) {
                HStack {
                    Text("보드게임 예약")
                        .font(.custom("AppleSDGothicNeoB00", size: 22))
                        .padding(.leading, 20)

                    Spacer()
                }

                VStack(spacing: 0) {
                    ZStack {
                        Spacer()
                        Text(selectionTitle)
                            .font(.custom("AppleSDGothicNeoB00", size: 18))
                        Image(systemName: isClicked ? "chevron.up" : "chevron.down")
                            .resizable()
                            .frame(width: 16, height: 9)
                            .padding(.leading, 312)
                    }
                    .padding(.vertical, 19)

                    if isClicked {
                        VStack(spacing: 0) {
                            DropdownItem(isSelecting: $isClicked,
                                         selectiontitle: $selectionTitle,
                                         selectionId: $maxOf,
                                         item: .init(id: 2, title: "2명",
                                                     onSelect: { viewModel.maxOf = 2 }))
                            DropdownItem(isSelecting: $isClicked,
                                         selectiontitle: $selectionTitle,
                                         selectionId: $maxOf,
                                         item: .init(id: 3, title: "3명",
                                                     onSelect: { viewModel.maxOf = 3 }))
                            DropdownItem(isSelecting: $isClicked,
                                         selectiontitle: $selectionTitle,
                                         selectionId: $maxOf,
                                         item: .init(id: 4, title: "4명",
                                                     onSelect: { viewModel.maxOf = 4}))
                        }
                        .padding(.bottom, 10)
                    }
                }
                .frame(width: 360)
                .background(.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .inset(by: 0.5)
                        .stroke(.black, lineWidth: 1)
                )
                .onTapGesture {
                    isClicked.toggle()
                }
                .padding(.top, 32)

                Spacer()

                if maxOf != 0 {
                    VStack(spacing: 0) {
                        Text("완료")
                            .font(.custom("AppleSDGothicNeoB00", size: 18))
                            .foregroundStyle(.white)
                            .frame(width: 360, height: 54)
                            .background(Color.P30)
                            .cornerRadius(10)
                            .onTapGesture {
                                viewModel.submitBoardGame()
                                dismiss()
                            }
                    }
                    .padding(.bottom, 28)
                }
            }
        }
    }
}

#Preview {
    BoardGameApplicationView()
}
