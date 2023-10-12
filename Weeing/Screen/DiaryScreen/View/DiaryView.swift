//
//  ConsultLogView.swift
//  Weeing
//
//  Created by 서지완 on 2023/09/26.
//

import SwiftUI
import PopupView

struct DiaryView: View {
    /*@State private var isShowingInitialPopup = false
    @State private var isShowingCancelConfirmation = false
    @State private var isShowingCancellationComplete = false*/
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            ZStack {
                Color.BG.ignoresSafeArea()

                VStack(spacing: 0) {

                
                    Text("공유일기")
                        .font(.system(size: 27))
                        .fontWeight(.bold)
                            .padding(.trailing, 250)
                            .padding(.bottom, 30)
                            .padding(.top, 058)
                    
                    
                    ScrollView(showsIndicators: false) {
                        LazyVStack {
                            /*Button(action: {
                                isShowingInitialPopup.toggle()
                            }) {
                                popupScreen2(listColor: Color.P30)
                            }*/

                            ForEach(0 ..< 6, id: \.self) { _ in
                                popupScreen2(listColor: Color.gray)
                            }
                        }
                    }
                    .frame(height: 750)
                }
            }
            /*.overlay(
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
                        .font(Font.custom("AppleSDGothicNeoSB00", size: 16))
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
                                .font(Font.custom("AppleSDGothicNeoSB00", size: 13))
                                .foregroundColor(.black)
                                .frame(width: 150)
                        }
                        
                        Divider()
                        
                        Button {
                            isShowingInitialPopup = false
                            isShowingCancelConfirmation = true
                        } label: {
                            Text("취소")
                                .font(Font.custom("AppleSDGothicNeoSB00", size: 13))
                                .foregroundColor(Color(red: 0.86, green: 0, blue: 0))
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
                    Text("정말로 취소 하시겠습니까?")
                        .font(Font.custom("AppleSDGothicNeoSB00", size: 16))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.86, green: 0, blue: 0))
                        .frame(width: 300, alignment: .top)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white)
                        )
                        .padding(.top, 52)
                        .lineLimit(nil)
                    Divider()
                        .frame(height: 2)
                        .padding(.top, 48)
                        .padding(.bottom, 12)


                    HStack {
                        Button {
                            isShowingCancelConfirmation = false
                        } label: {
                            Text("취소")
                                .font(Font.custom("AppleSDGothicNeoSB00", size: 13))
                                .foregroundColor(.black)
                                .frame(width: 150)
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
            }*/
        }
    }
}

func popupScreen2(listColor: Color) -> some View {
    return VStack(alignment: .leading) {
        var Diarycontent = "오늘은 학교에서 야구장을 가는 날이다!! 저번에 우천취소로 야구장을 가지 못하고 정말 슬펐는데 가을 야구 가기 전 마지막 경기를 보게 돼서 기분이 너무 좋다!! 물론 학교를 홍보하기 위해서 가는 것도 맞지만 학교 홍보도 하고 학생들도 즐기고 이게 바로 일석이조 아닌가!!  야구장을 가기 위해서 과잠도 입고 아침일찍 일어나서 준비했다... 그리고 또 학생회 친구들은 직접 만든 피켓을 들고 홍보를 해야한다구 했다. 조금 웃기긴 하지만 학교를 홍보하기 위해서 못할 건 없다!! 내년 후배들이 기대된다."
        Text("야구장 가는날")
            .font(.system(size: 18).bold())
            .foregroundColor(.black)
            .padding(.top, -8)
            .padding([.leading, .trailing], 15)
        Text("1314 서지완")
            .foregroundColor(listColor)
            .font(.system(size: 12))
            .padding(.leading, 119)
            .padding(.top,-27)
        Text(Diarycontent)
            .font(.system(size: 12))
            .foregroundColor(.black)
            .padding(.top, -9)
            .multilineTextAlignment(.leading)
            .lineLimit(5) // 원하는 줄 수로 설정
            .truncationMode(.tail)
            .lineSpacing(5)
            .padding([.leading, .trailing], 15)
    }
    .padding(16)
    .background(
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(listColor, lineWidth: 1)
            ).padding([.leading, .trailing], 15)
    )
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView()
    }
}

