//
//  ConsultationView.swift
//  Weeing
//
//  Created by 한재형 on 2023/09/04.
//

import SwiftUI

struct ConsultationView: View {
//    @State var isSelected = false
//    @State var classSelected = false
//    @State var selectedOption = "교시를 선택하세요."
//    @State private var texteditor = ""
    var body: some View {
        NavigationView{
            ZStack{
                Color.BG.ignoresSafeArea()
                
//                VStack(spacing: 0) {
//                    HStack(spacing: 0){
//                        Text(selectedOption)
//                            .font(.custom("AppleSDGothicNeoB00", size: 18))
//                        //                            .multilineTextAlignment(.center)
//                        Spacer()
//                        Image(systemName: isSelected ? "chevron.up" : "chevron.down")
//                            .padding(.trailing, 22)
//                    }
//                    .padding(.horizontal)
//                    .background(
//                        RoundedRectangle(cornerRadius: 10)
//                            .stroke(Color.S20, lineWidth: 1)
//                            .background(Color.S10)
//                            .frame(width: 360, height: 60)
//                    )
//                    .frame(width: 360, height: 60)
//                    .onTapGesture {
//                        isSelected.toggle()
//                    }
//                    .padding(.top, 33)
//                    Spacer()
//                    if isSelected{
//                        VStack(spacing: 0){
//                            Text("5교시")
//                                .font(.custom("AppleSDGothicNeoB00", size: 18))
//                                .onTapGesture {
//                                    selectedOption = "5교시"
//                                    isSelected.toggle()
//                                    classSelected = true
//                                }
//                                .frame(height: 60)
//                            Divider()
//                                .frame(height: 1)
//                                .background(Color.S20)
//                            Text("6교시")
//                                .font(.custom("AppleSDGothicNeoB00", size: 18))
//                                .frame(height: 60)
//                                .onTapGesture {
//                                    selectedOption = "6교시"
//                                    isSelected.toggle()
//                                    classSelected = true
//                                }
//                            Divider()
//                                .frame(height: 1)
//                                .background(Color.S20)
//                            Text("7교시")
//                                .font(.custom("AppleSDGothicNeoB00", size: 18))
//                                .frame(height: 60)
//                                .onTapGesture {
//                                    selectedOption = "7교시"
//                                    isSelected.toggle()
//                                    classSelected = true
//                                }
//                        }
//                        .frame(width: 360, height: 180)
//                        .background(
//                            RoundedRectangle(cornerRadius: 10)
//                                .stroke(Color.S20, lineWidth: 1)
//                                .background(Color.S10)
//                        )
//                        .padding(.top, 10)
//                        .padding(.bottom, classSelected ? 10 : 514)
//                    }
//                    if classSelected{
//                        VStack(spacing: 0){
//                            HStack(spacing: 0){
//                                Text("상담 사유")
//                                    .font(.custom("AppleSDGothicNeoEB00", size: 18))
//                                    .padding(.top, 10)
//                                Spacer()
//                            }.padding(.horizontal)
//                            TextEditor(text: $texteditor)
//                                .cornerRadius(10)
//                                .frame(width: 360, height: 180)
//                                .overlay{
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .inset(by: 0.5)
//                                        .stroke(Color.N20, lineWidth: 1)
//                                }
//                                .padding(.top, 8)
//                        }
//                        HStack(spacing: 0){
//                            Text("상담 신청 이유를 간결하게 적어주세요.")
//                                .font(.custom("AppleSDGothicNeoM00", size: 12))
//                                .foregroundColor(Color.N10)
//                            Spacer()
//                        }
//                        .padding(.horizontal)
//                        .padding(.bottom, 368)
//                        NavigationLink{
//                            //                                ConsultationView()
//                        }label: {
//                            Text("완료")
//                                .font(.custom("AppleSDGothicNeoB00", size: 18))
//                                .foregroundColor(.white)
//                                .frame(width: 360, height: 54)
//                                .background(Color.P30)
//                                .cornerRadius(10)
//                                .padding(.top, 10)
//                                .padding(.bottom, 18)
//                        }
//                    }
//                }
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
