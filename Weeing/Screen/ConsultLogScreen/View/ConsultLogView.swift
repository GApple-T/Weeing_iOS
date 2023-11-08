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
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                            .padding(.trailing, 288)
                            .padding(.leading,20)
                            .padding(.top, 11)
                    
                    ScrollView(showsIndicators: false) {
                        LazyVStack {
                            Button(action: {
                                isShowingInitialPopup.toggle()
                            }) {
                                popupScreen(listColor: Color.P30,listname:"신청",listtime: 7)
                                    .padding(.top,30)
                            }

                            ForEach(0 ..< 6, id: \.self) { _ in
                                popupScreen(listColor: Color.gray,listname:"완료",listtime: 6)
                                    .padding(.top,10)
                            }
                        }
                    }
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
                ZStack {
                    VStack{
                        Text("2023.11.21 (7교시) 상담")
                            .font(.custom("AppleSDGothicNeoSB00", size: 16))
                            .padding(.top,-30)
                            .background(RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.white)
                            )
                        
                    }
                    Rectangle()
                      .frame(width: 320, height: 0.5)
                      .background(Color.black)
                    .padding(.top,76)
                    
                    HStack {
                        Button {
                            isShowingInitialPopup = false
                            
                        } label: {
                            Text("변경")
                                .font(.custom("AppleSDGothicNeoSB00", size: 13))
                                .foregroundStyle(.black)
                                .frame(width: 150)
                                .padding(.top,130)
                        }
                        
                        Rectangle()
                        .frame(width: 0.5, height: 46)
                        .background(Color.black)
                        .padding(.top,135)
                        
                        Button {
                            isShowingInitialPopup = false
                            isShowingCancelConfirmation = true
                        } label: {
                            Text("취소")
                                .font(.custom("AppleSDGothicNeoSB00", size: 13))
                                .foregroundStyle(Color.ERORR)
                                .frame(width: 150)
                                .padding(.top,130)
                        }
                        
                    }
                    .padding(.bottom, 12)
                }
                .frame(width: 320, height: 168)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .popup(isPresented: $isShowingCancelConfirmation) {
                ZStack {
                    VStack{
                        Text("정말로 취소 하시겠습니까?")
                            .font(.custom("AppleSDGothicNeoSB00", size: 16))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(Color.ERORR)
                            .padding(.top, -30)
                            .frame(width: 300, alignment: .top)
                            .background(RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.white)
                            )
                            .lineLimit(nil)
                    }
                    Rectangle()
                      .frame(width: 320, height: 0.5)
                      .background(Color.black)
                    .padding(.top,76)
                    
                    HStack {
                        Button {
                            isShowingCancelConfirmation = false
                        } label: {
                            Text("취소")
                                .font(.custom("AppleSDGothicNeoSB00", size: 13))
                                .foregroundStyle(.black)
                                .frame(width: 150)
                                .padding(.top,130)
                                .bold()
                        }
                        Rectangle()
                        .frame(width: 0.5, height: 46)
                        .background(Color.black)
                        .padding(.top,135)
                        
                        Button {
                            isShowingCancelConfirmation = false
                            isShowingCancellationComplete = true
                        } label: {
                            Text("확인")
                                .font(.custom("AppleSDGothicNeoSB00", size: 13))
                                .foregroundStyle(.black)
                                .frame(width: 150)
                                .padding(.top,130)
                        }
                    }
                    .padding(.bottom, 12)
                }
                .frame(width: 320, height: 168)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .popup(isPresented: $isShowingCancellationComplete) {
                ZStack {
                    VStack{
                        Text("상담 취소가 완료되었습니다.")
                            .font(.custom("AppleSDGothicNeoSB00", size: 16))
                            .padding(.top,-55)
                            .background(RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.white)
                            )
                            .padding(.top, 52)
                    }
                    
                    Rectangle()
                      .frame(width: 320, height: 0.5)
                      .background(Color.black)
                    .padding(.top,76)
                    
                    Button {
                        isShowingCancellationComplete = false
                    } label: {
                        Text("확인")
                            .font(.custom("AppleSDGothicNeoSB00", size: 13))
                            .foregroundStyle(.black)
                            .padding(.top,130)
                            .frame(width: 320)
                    }
                    .padding(.bottom, 12)
                }
                .frame(width: 320, height: 168)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
    }
}

@ViewBuilder
func popupScreen(listColor: Color,listname: String,listtime: Int) -> some View {
    ZStack{
        Rectangle()
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .foregroundStyle(.white)
            .shadow(color: Color("Shadow"), radius: 15, x: 3, y: 2)
            .frame(width: 360,height: 102)
        
        
        VStack(alignment: .leading, spacing: 7) {
            Text("2023.11.21 (\(listtime)교시) 상담 \(listname)")
                .font(.custom("AppleSDGothicNeoSB00", size: 18))
                .foregroundStyle(listColor)
                

            Text("상담사유")
                .foregroundStyle(.black)
                .font(.custom("AppleSDGothicNeoB00", size: 13))
                
            
            Text("요즘 너무 힘드러용... 전공도 그렇구 학교 생활이 너무 괴롭습니다 선생님... 저 좀 도와주세요 ㅠㅠ 진짜 잘하구 싶은데 잘 안됩니다ㅠㅠ 넘 힘들어요 버틸수 있을지 모르겠어요... 힘드네요.")
                .frame(width: 338)
                .font(.system(size: 10))
                .foregroundStyle(.gray)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .lineSpacing(5)
                
        }.padding(.leading,12)
    }
}

struct ConsultLogView_Previews: PreviewProvider {
    static var previews: some View {
        ConsultLogView()
    }
}

