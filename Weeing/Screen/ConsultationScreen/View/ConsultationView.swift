//
//  ConsultationView.swift
//  Weeing
//
//  Created by 한재형 on 2023/09/04.
//

import SwiftUI

struct ConsultationView: View {
    @State var isSelecting = false
    @State var selectionTitle = "교시를 선택하세요"
    @State var selectedRowId = 0
    @State var texteditor = ""
    var body: some View {
        NavigationView{
            ZStack{
                Color.BG.ignoresSafeArea()
                VStack(spacing: 0){
                    VStack(spacing: 0) { //교시 선택 버튼
                        HStack(spacing: 0) {
                            Spacer()
                            Text(selectionTitle)
                                .font(.custom("AppleSDGothicNeoB00", size: 18))
                                .padding(.leading, 55)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .resizable()
                                .frame(width: 16, height: 9)
                                .padding(.trailing, 24)
                        }
                        .padding(.vertical, 19)
                        
                        if isSelecting {
                            VStack(spacing: 0) {
                                DropdownItem(isSelecting: $isSelecting,
                                             selectiontitle: $selectionTitle,
                                             selectionId: $selectedRowId,
                                             item: .init(id: 1, title: "5교시",
                                                         onSelect: {}))
                                DropdownItem(isSelecting: $isSelecting,
                                             selectiontitle: $selectionTitle,
                                             selectionId: $selectedRowId,
                                             item: .init(id: 2, title: "6교시",
                                                         onSelect: {}))
                                DropdownItem(isSelecting: $isSelecting,
                                             selectiontitle: $selectionTitle,
                                             selectionId: $selectedRowId,
                                             item: .init(id: 3, title: "7교시",
                                                         onSelect: {}))
                            }
                            .padding(.bottom, 10)
                        }
                    }
                    .frame(width: 360)
                    .background(Color.S10)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .inset(by: 0.5)
                            .stroke(Color(red: 1, green: 0.68, blue: 0.2), lineWidth: 1)
                    )
                    .onTapGesture {
                        isSelecting.toggle()
                    }
                    Spacer()
                    VStack(spacing: 0){
                        if selectedRowId != 0{
                            VStack(spacing: 0){
                                HStack(spacing: 0){
                                    Text("상담 사유")
                                        .font(.custom("AppleSDGothicNeoEB00", size: 18))
                                        .padding(.top, 10)
                                    Spacer()
                                }.padding(.horizontal)
                                TextEditor(text: $texteditor)
                                    .cornerRadius(10)
                                    .frame(width: 360, height: 180)
                                    .overlay{
                                        RoundedRectangle(cornerRadius: 10)
                                            .inset(by: 0.5)
                                            .stroke(Color.N20, lineWidth: 1)
                                    }
                                    .padding(.top, 8)
                                HStack(spacing: 0){
                                    Text("상담 신청 이유를 간결하게 적어주세요.")
                                        .font(.custom("AppleSDGothicNeoM00", size: 12))
                                        .foregroundColor(Color.N10)
                                    Spacer()
                                }
                                .padding(.horizontal)
                            }
                            Spacer()
                            NavigationLink{ // 완료 버튼
                                HomeView()
                            }label: {
                                Text("완료")
                                    .font(.custom("AppleSDGothicNeoB00", size: 18))
                                    .foregroundColor(.white)
                                    .frame(width: 360, height: 54)
                                    .background(Color.P30)
                                    .cornerRadius(10)
                                    .padding(.top, 10)
                                    .padding(.bottom, 18)
                            }
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct ConsultationView_Previews: PreviewProvider {
    static var previews: some View {
        ConsultationView()
    }
}
