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

                        Text("Weeing")
                            .font(.custom("Nunito-Black", size: 30))
                            .foregroundColor(Color.P30)
                            .padding(.trailing, 240)
                            .padding(.bottom, 10)
                            .padding(.top, 55)
                    
                    
                    ScrollView(showsIndicators: false) {
                        LazyVStack {
                            HStack {
                                Text("상담예약")
                                    .font(.system(size: 27))
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            .padding(.horizontal, 23)
                            
                            Button(action: {
                                isShowingInitialPopup.toggle()
                            }) {
                                VStack(alignment: .leading) {
                                    Text("2023.11.21 (7교시) 상담 신청")
                                        .font(.system(size: 18).bold())
                                        .foregroundColor(Color("P30"))
                                        .padding(.top, -8)
                                    Text("상담사유")
                                        .foregroundColor(.black)
                                        .font(.system(size: 13).bold())
                                    Text("요즘 너무 힘드러용... 전공도 그렇구 학교 생활이 너무 괴롭습니다 선생님... 저 좀 도와주세요 ㅠㅠ 진짜 잘하구 싶은데 잘 안됩니다ㅠㅠ 넘 힘들어요 버틸수 있을지 모르겠어요... 힘드네요.")
                                        .font(.system(size: 10))
                                        .foregroundColor(.gray)
                                        .padding(.top, -5)
                                        .multilineTextAlignment(.leading)
                                }
                                .padding(16)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.white)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .strokeBorder(Color("P30"), lineWidth: 1)
                                        )
                                )
                            }

                            ForEach(0 ..< 6, id: \.self) { _ in
                                VStack(alignment: .leading) {
                                    Text("2023.11.21 (6교시) 상담 신청")
                                        .font(.system(size: 18).bold())
                                        .foregroundColor(Color("N20"))
                                        .padding(.top, -8)
                                    Text("상담사유")
                                        .foregroundColor(.black)
                                        .font(.system(size: 13).bold())
                                    Text("요즘 너무 힘드러용... 전공도 그렇구 학교 생활이 너무 괴롭습니다 선생님... 저 좀 도와주세요 ㅠㅠ 진짜 잘하구 싶은데 잘 안됩니다ㅠㅠ 넘 힘들어요 버틸수 있을지 모르겠어요... 힘드네요.")
                                        .font(.system(size: 10))
                                        .foregroundColor(.gray)
                                        .padding(.top, -5)
                                }
                                .padding(16)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.white)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .strokeBorder(Color.gray, lineWidth: 1)
                                        )
                                )
                            }
                        }
                    }
                    .background(Color("BG"))
                    .frame(height: 750)
                    .listStyle(.plain)
                    //.border(Color.gray, width: 1) // ScrollView 범위 확인

                    Spacer()
                }
            }
            .overlay(
                ZStack {
                    if isShowingInitialPopup || isShowingCancelConfirmation || isShowingCancellationComplete {
                        Color.black.opacity(0.3)
                            .ignoresSafeArea()
                    }
                }
            )
            .popup(isPresented: $isShowingInitialPopup) {
                VStack(spacing: 0) {
                    Text("2023.11.21 (7교시) 상담")
                        .font(.custom("AppleSDGothicNeoSB00", size: 16))
                        .background(RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white)
                        )
                        .padding(.top, 52)
                    Divider()
                        .padding(.top, 48)
                        .padding(.bottom, 12)
                    
                    HStack {
                        Button {
                            isShowingInitialPopup = false
                            
                        } label: {
                            Text("변경")
                                .font(.custom("AppleSDGothicNeoSB00", size: 13))
                                .foregroundColor(.black)
                                .frame(width: 150)
                        }
                        
                        Divider()
                        
                        Button {
                            isShowingInitialPopup = false
                            isShowingCancelConfirmation = true
                        } label: {
                            Text("취소")
                                .font(.custom("AppleSDGothicNeoSB00", size: 13))
                                .foregroundColor(.red)
                                .frame(width: 150)
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
                    Text("정말로 취소하시겠습니까?")
                        .foregroundColor(.red)
                        .font(.custom("AppleSDGothicNeoSB00", size: 16))
                        .background(RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white)
                        )
                        .padding(.top, 52)
                    Divider()
                        .frame(height: 2)
                        .padding(.top, 48)
                        .padding(.bottom, 12)

                    HStack {
                        Button {
                            isShowingCancelConfirmation = false
                        } label: {
                            Text("취소")
                                .font(.custom("AppleSDGothicNeoSB00", size: 13))
                                .foregroundColor(.black)
                                .frame(width: 150)
                        }
                        Divider()
                        
                        Button {
                            isShowingCancelConfirmation = false
                            isShowingCancellationComplete = true
                        } label: {
                            Text("확인")
                                .font(.custom("AppleSDGothicNeoSB00", size: 13))
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
                        .font(.custom("AppleSDGothicNeoSB00", size: 16))
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
                            .font(.custom("AppleSDGothicNeoSB00", size: 13))
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

struct ConsultLogView_Previews: PreviewProvider {
    static var previews: some View {
        ConsultLogView()
    }
}
