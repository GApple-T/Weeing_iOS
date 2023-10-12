//
//  ConsultLogView.swift
//  Weeing
//
//  Created by 서지완 on 2023/09/26.
//

import SwiftUI
import PopupView

struct ConsultLogView: View {
    @State private var isShowingInitialPopup = false
    @State private var isShowingCancelConfirmation = false
    @State private var isShowingCancellationComplete = false
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            ZStack {
                Color.BG.ignoresSafeArea()

                VStack(spacing: 0) {

                
                    Text("상담내역")
                        .font(.system(size: 27))
                        .fontWeight(.bold)
                            .padding(.trailing, 250)
                            .padding(.bottom, 30)
                            .padding(.top, 120)
                    Spacer()
                    
                    ScrollView(showsIndicators: false) {
                        LazyVStack {
                            Button(action: {
                                isShowingInitialPopup.toggle()
                            }) {
                                popupScreen(listColor: Color.P30)
                                    .padding(.top,15)
                            }

                            ForEach(0 ..< 6, id: \.self) { _ in
                                popupScreen(listColor: Color.gray)
                                    .padding(.top,5)
                            }
                        }
                    }
                    .frame(height: 820)
                }
            }
            .overlay(
                ZStack {
                    if isShowingInitialPopup || isShowingCancelConfirmation || isShowingCancellationComplete {
                        Color.black.opacity(0.5)
                            .ignoresSafeArea()
                    }
                }
            )
            .popup(isPresented: $isShowingInitialPopup) {
                VStack(spacing: 0) {
                    Text("2023.11.21 (7교시) 상담")
                        .font(Font.custom("AppleSDGothicNeoSB00", size: 16))
                        .background(RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white)
                        )
                        .padding(.top, 52)
                    Divider()
                        .padding(.top, 45)
                    
                    HStack {
                        Button {
                            isShowingInitialPopup = false
                            
                        } label: {
                            Text("변경")
                                .font(Font.custom("AppleSDGothicNeoSB00", size: 13).bold())
                                .foregroundColor(.black)
                                .frame(width: 150)
                                .padding(.top,10)
                        }
                        
                        Divider()
                        
                        Button {
                            isShowingInitialPopup = false
                            isShowingCancelConfirmation = true
                        } label: {
                            Text("취소")
                                .font(Font.custom("AppleSDGothicNeoSB00", size: 13))
                                .foregroundColor(Color("Popupred"))
                                .frame(width: 150)
                                .bold()
                                .padding(.top,10)
                        }
                    }
                    .padding(.bottom, 12)
                }
                .frame(width: 320, height: 168)
                .background(Color.white)
                .cornerRadius(10)
            }
            .popup(isPresented: $isShowingCancelConfirmation) {
                VStack(spacing: 0) {
                    Text("정말로 취소 하시겠습니까?")
                        .font(Font.custom("AppleSDGothicNeoSB00", size: 16))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("Popupred"))
                        .frame(width: 300, alignment: .top)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white)
                        )
                        .padding(.top, 52)
                        .lineLimit(nil)
                    Divider()
                        .padding(.top, 45)
                    
                    HStack {
                        Button {
                            isShowingCancelConfirmation = false
                        } label: {
                            Text("취소")
                                .font(Font.custom("AppleSDGothicNeoSB00", size: 13))
                                .foregroundColor(.black)
                                .frame(width: 150)
                                .bold()
                        }
                        Divider()
                        
                        Button {
                            isShowingCancelConfirmation = false
                            isShowingCancellationComplete = true
                        } label: {
                            Text("확인")
                                .font(Font.custom("AppleSDGothicNeoSB00", size: 13))
                                .foregroundColor(.black)
                                .frame(width: 150)
                        }
                    }
                    .padding(.bottom, 12)
                }
                .frame(width: 320, height: 168)
                .background(Color.white)
                .cornerRadius(10)
            }
            .popup(isPresented: $isShowingCancellationComplete) {
                VStack(spacing: 0) {
                    Text("상담 취소가 완료되었습니다.")
                        .font(Font.custom("AppleSDGothicNeoSB00", size: 16))
                        .background(RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white)
                        )
                        .padding(.top, 52)
                    Divider()
                        .frame(height: 2)
                        .padding(.top, 48)
                        .padding(.bottom, 12)
                    
                    Button {
                        isShowingCancellationComplete = false
                    } label: {
                        Text("확인")
                            .font(Font.custom("AppleSDGothicNeoSB00", size: 13))
                            .foregroundColor(.black)
                            .frame(width: 320)
                    }
                    .padding(.bottom, 12)
                }
                .frame(width: 320, height: 168)
                .background(Color.white)
                .cornerRadius(10)
            }
        }
    }
}

func popupScreen(listColor: Color) -> some View {
    return VStack(alignment: .leading) {
        Text("2023.11.21 (6교시) 상담 신청")
            .font(.system(size: 18).bold())
            .foregroundColor(listColor)
            .padding(.top, -8)
            .padding([.leading, .trailing], 15)
        Text("상담사유")
            .foregroundColor(.black)
            .font(.system(size: 13).bold())
            .padding([.leading, .trailing], 15)
            .padding(.top,-4)
        Text("요즘 너무 힘드러용... 전공도 그렇구 학교 생활이 너무 괴롭습니다 선생님... 저 좀 도와주세요 ㅠㅠ 진짜 잘하구 싶은데 잘 안됩니다ㅠㅠ 넘 힘들어요 버틸수 있을지 모르겠어요... 힘드네요.")
            .font(.system(size: 10))
            .foregroundColor(.gray)
            .padding(.top, -2)
            .multilineTextAlignment(.leading)
            .truncationMode(.tail)
            .lineSpacing(5)
            .padding([.leading, .trailing], 15)
    }
    .padding(16)
    .background(
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.white)
            .shadow(color: Color("Shadow"), radius: 10, x: 10, y: 0)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(.white, lineWidth: 1)                
                    
            )
            .padding(.horizontal, 15)
    )
}

struct ConsultLogView_Previews: PreviewProvider {
    static var previews: some View {
        ConsultLogView()
    }
}

