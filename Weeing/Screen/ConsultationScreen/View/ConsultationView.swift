//
//  ConsultationView.swift
//  Weeing
//
//  Created by 한재형 on 2023/09/04.
//

import PopupView
import SwiftUI
import SwiftUICalendar

struct ConsultationView: View {
    @State var isSelecting = false
    @State var isSelected = false
    @State private var isPresentedFloating = false
    @State var selectionTitle = "교시를 선택하세요"
    @State var selectedRowId = 0
    @State var texteditor = ""
    @Environment(\.dismiss) var dismiss
    @ObservedObject var controller: CalendarController = .init()
    @State var focusDate: YearMonthDay? = YearMonthDay.current
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("yyyy MMMM")
        return formatter
    }()

    @State var date = Date()
    var body: some View {
        NavigationView {
            ZStack {
                Color.BG.ignoresSafeArea()
                VStack(spacing: 0) {
                    if isSelected != true {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width: 360, height: 360)
                                .foregroundStyle(Color.S10)

                            VStack(spacing: 0) {
                                HStack(spacing: 0) {
                                    Text("\(date.formatted(.dateTime.month(.wide)))")
                                        .font(.custom("AppleSDGothicNeoB00", size: 20))
                                    Spacer()
                                    Button {
                                        self.changeDateBy(-1)
                                        controller.scrollTo(controller.yearMonth.addMonth(value: -1), isAnimate: true)
                                    } label: {
                                        Image(systemName: "chevron.left")
                                            .foregroundColor(Color.S20)
                                    }
                                    .padding(.trailing, 30)
                                    Button {
                                        self.changeDateBy(1)
                                        controller.scrollTo(controller.yearMonth.addMonth(value: 1), isAnimate: true)
                                    } label: {
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(Color.S20)
                                    }
                                }
                                .padding(.top, 15)
                                .padding(.bottom, 10)
                                .padding(.horizontal, 13)
                                Divider()
                                    .frame(width: 320)
                                CalendarView(controller, header: { week in
                                    GeometryReader { geometry in
                                        Text(week.shortString)
                                            .font(.system(size: 12))
                                            .fontWeight(.semibold)
                                            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                                    }
                                }, component: { date in
                                    if date.isToday {
                                        calenderday(day: "\(date.day)", isToday: true)
                                            .background(focusDate == date ? Color.S20 : .P30)
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                            .onTapGesture {
                                                focusDate = (date != focusDate ? date : nil)
                                            }
                                            .padding(.leading, 2)
                                            .padding(.trailing, 2)
                                    } else {
                                        calenderday(day: "\(date.day)", isToday: false)
                                            .opacity(date.isFocusYearMonth == true ? 1 : 0.4)
                                            .foregroundColor(focusDate == date ? .white : .black)
                                            .background(focusDate == date ? Color.S20 : .S10)
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                            .onTapGesture {
                                                focusDate = (date != focusDate ? date : nil)
                                            }
                                            .padding(.leading, 2)
                                            .padding(.trailing, 2)
                                    }
                                })
                            }
                            .frame(width: 340, height: 340)
                            .background(Color.S10)
                            .cornerRadius(16)
                        }
                        .padding(.bottom, 12)
                    }

                    VStack(spacing: 0) { // 교시 선택 버튼
                        ZStack {
                            Spacer()
                            Text(selectionTitle)
                                .font(.custom("AppleSDGothicNeoB00", size: 18))
                            Image(systemName: isSelecting ? "chevron.up" : "chevron.down")
                                .resizable()
                                .frame(width: 16, height: 9)
                                .padding(.leading, 312)
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
                    .background(.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .inset(by: 0.5)
                            .stroke(.black, lineWidth: 1)
                    )
                    .onTapGesture {
                        isSelecting.toggle()
                    }
                    Spacer()
                    VStack(spacing: 0) {
                        if selectedRowId != 0 {
                            if isSelected != true {
                                Button {
                                    isSelected.toggle() // 상담 사유 적는 페이지로 넘어가기
                                    if isSelecting {
                                        isSelecting.toggle() // 교시 선택 버튼
                                    }
                                } label: {
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
                        if isSelected {
                            VStack(spacing: 0) {
                                HStack(spacing: 0) {
                                    Text("상담 사유")
                                        .font(.custom("AppleSDGothicNeoEB00", size: 18))
                                        .padding(.top, 10)
                                        .padding(.leading, 20)
                                    Spacer()
                                }
                                TextEditor(text: $texteditor)
                                    .cornerRadius(10)
                                    .frame(width: 360, height: 180)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .inset(by: 0.5)
                                            .stroke(Color.N20, lineWidth: 1)
                                    }
                                    .padding(.top, 8)
                                HStack(spacing: 0) {
                                    Text("상담 신청 이유를 간결하게 적어주세요.")
                                        .font(.custom("AppleSDGothicNeoM00", size: 12))
                                        .foregroundColor(Color.N10)
                                        .frame(height: 22)
                                        .padding(.leading, 22)
                                    Spacer()
                                }
                            }
                            Spacer()
                            Button { // 완료 버튼
                                isPresentedFloating.toggle()
                            } label: {
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
            }.popup(isPresented: $isPresentedFloating) {
                VStack(spacing: 0) {
                    Text("상담 신청이 완료 되었습니다.")
                        .font(.custom("AppleSDGothicNeoSB00", size: 16))
                        .background(RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white)
                        )
                        .padding(.top, 52)
                    Divider()
                        .padding(.top, 48)
                        .padding(.bottom, 12)
                    Button {
                        dismiss()
                    } label: {
                        Text("확인")
                            .font(.custom("AppleSDGothicNeoSB00", size: 15))
                            .foregroundColor(.black)
                            .frame(width: 320)
                    }
                    .padding(.bottom, 12)
                }
                .frame(width: 320, height: 168)
                .background(Color.white)
                .cornerRadius(10)
            } customize: {
                $0
                    .type(.default)
                    .position(.center)
                    .animation(.spring())
                    .backgroundColor(.black.opacity(0.3))
                    .closeOnTap(false)
                    .dragToDismiss(false)
            }
        }
        .navigationBarBackButtonHidden()
    }
    func changeDateBy(_ months: Int) {
        if let date = Calendar.current.date(byAdding: .month, value: months, to: date) {
            self.date = date
        }
    }
}

struct ConsultationView_Previews: PreviewProvider {
    static var previews: some View {
        ConsultationView()
    }
}
