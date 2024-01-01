//
//  ConsultLogView.swift
//  Weeing
//
//  Created by 서지완 on 2023/09/26.
//

import PopupView
import SwiftUI

struct ConsultLogView: View {
    @State private var isShowingInitialPopup = false
    @State private var isShowingCancelConfirmation = false
    @State private var isShowingCancellationComplete = false
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = ConsultLogViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                Color.BG.ignoresSafeArea()

                VStack(spacing: 0) {
                    Text("상담내역")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .padding(.trailing, 288)
                        .padding(.leading, 20)
                        .padding(.top, 11)
                        .padding(.bottom, 20)

                    ScrollView(showsIndicators: false) {
                        VStack {
                            if viewModel.isDataLoaded {
                                ForEach(viewModel.consults, id: \.id) { consultLog in
                                    Button {
                                        isShowingInitialPopup = true

                                    } label: {
                                        RoundedRectangle(cornerRadius: 10)
                                            .shadow(color: .Shadow, radius: 15, x: 3, y: 2)
                                            .frame(width: 360, height: 102)
                                            .foregroundStyle(.white)
                                            .overlay(
                                                VStack(alignment: .leading) {
                                                    Text("2024.01.03 (\(consultLog.time)교시) 상담 신청")
                                                        .font(.custom("AppleSDGothicNeoSB00", size: 18))
                                                        .foregroundStyle(Color.P30)
                                                        .padding(.top, 7)
                                                        .padding(.leading, 12)

                                                    Text("상담사유")
                                                        .foregroundStyle(Color.N10)
                                                        .font(.custom("AppleSDGothicNeoB00", size: 13))
                                                        .padding(.leading, 12)

                                                    Text(consultLog.description)
                                                        .frame(maxWidth: .infinity, alignment: .leading)
                                                        .multilineTextAlignment(.leading)
                                                        .padding(.leading, 12)
                                                        .font(.system(size: 10))
                                                        .foregroundStyle(.gray)
                                                        .lineLimit(2)
                                                        .lineSpacing(7)
                                                        .padding(.top, 1)

                                                    Spacer()
                                                }
                                            )
                                    }
                                }.padding(.top, 10)
                            } else {
                                ProgressView("로딩 중...")
                                    .padding()

                                Text(viewModel.errorMessage)
                                    .foregroundColor(.red)
                                    .padding()
                            }
                        }
                    }.onAppear {
                        viewModel.loadConsultLogs()
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
                    VStack {
                        Text("2023.11.21 (7교시) 상담")
                            .font(.custom("AppleSDGothicNeoB00", size: 16))
                            .padding(.top, -30)
                            .background(RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.white)
                            )
                    }
                    Rectangle()
                        .frame(width: 320, height: 0.5)
                        .background(Color.black)
                        .padding(.top, 76)

                    HStack {
                        Button {
                            isShowingInitialPopup = false

                        } label: {
                            Text("변경")
                                .font(.custom("AppleSDGothicNeoSB00", size: 13))
                                .foregroundStyle(.black)
                                .frame(width: 150)
                                .padding(.top, 130)
                        }

                        Rectangle()
                            .frame(width: 0.5, height: 46)
                            .background(Color.black)
                            .padding(.top, 135)

                        Button {
                            isShowingInitialPopup = false
                            isShowingCancelConfirmation = true
                        } label: {
                            Text("취소")
                                .font(.custom("AppleSDGothicNeoSB00", size: 13))
                                .foregroundStyle(Color.ERORR)
                                .frame(width: 150)
                                .padding(.top, 130)
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
                    VStack {
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
                        .padding(.top, 76)

                    HStack {
                        Button {
                            isShowingCancelConfirmation = false
                        } label: {
                            Text("취소")
                                .font(.custom("AppleSDGothicNeoSB00", size: 13))
                                .foregroundStyle(.black)
                                .frame(width: 150)
                                .padding(.top, 130)
                                .bold()
                        }
                        Rectangle()
                            .frame(width: 0.5, height: 46)
                            .background(Color.black)
                            .padding(.top, 135)

                        Button {
                            isShowingCancelConfirmation = false
                            isShowingCancellationComplete = true
                        } label: {
                            Text("확인")
                                .font(.custom("AppleSDGothicNeoSB00", size: 13))
                                .foregroundStyle(.black)
                                .frame(width: 150)
                                .padding(.top, 130)
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
                    VStack {
                        Text("상담 취소가 완료되었습니다.")
                            .font(.custom("AppleSDGothicNeoSB00", size: 16))
                            .padding(.top, -55)
                            .background(RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.white)
                            )
                            .padding(.top, 52)
                    }

                    Rectangle()
                        .frame(width: 320, height: 0.5)
                        .background(Color.black)
                        .padding(.top, 76)

                    Button {
                        isShowingCancellationComplete = false
                    } label: {
                        Text("확인")
                            .font(.custom("AppleSDGothicNeoSB00", size: 13))
                            .foregroundStyle(.black)
                            .padding(.top, 130)
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

struct ConsultLogView_Previews: PreviewProvider {
    static var previews: some View {
        ConsultLogView()
    }
}
