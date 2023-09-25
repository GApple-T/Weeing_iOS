//
//  CalenderView.swift
//  Weeing
//
//  Created by 한재형 on 2023/09/25.
//

import SwiftUI
import SwiftUICalendar

struct CalenderView: View{
    @ObservedObject var controller: CalendarController = CalendarController()
    @State var focusDate: YearMonthDay? = YearMonthDay.current
    var body: some View {
        
        VStack(spacing: 0){
            HStack(spacing: 0){
                Text("\(controller.yearMonth.monthShortString)")
                    .font(.custom("AppleSDGothicNeoB00", size: 30))
                    .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                Spacer()
                Button{
                    controller.scrollTo(controller.yearMonth.addMonth(value: -1), isAnimate: true)
                }label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color.S20)
                }
                .padding(.trailing, 30)
                Button{
                    controller.scrollTo(controller.yearMonth.addMonth(value: 1), isAnimate: true)
                }label: {
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color.S20)
                }
            }
            .padding(.horizontal)
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
                if date.isToday{
                    calenderday(day: "\(date.day)", isToday: true)
                        .background(focusDate == date ? Color.S20 : .P30)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .onTapGesture {
                            focusDate = (date != focusDate ? date : nil)
                        }
                        .padding(.leading, 2)
                        .padding(.trailing, 2)
                }
                else{
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
        .frame(width: 360, height: 360)
        .background(Color.S10)
        .cornerRadius(16)
        .padding(.bottom, 12)
        
    }
}

struct CalenderView_Previews: PreviewProvider {
    static var previews: some View {
        CalenderView()
    }
}
