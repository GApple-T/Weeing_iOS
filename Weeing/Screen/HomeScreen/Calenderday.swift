import SwiftUI
import SwiftUICalendar

@ViewBuilder func calenderday(day: String, isToday: Bool) -> some View {
    GeometryReader { geometry in
        if isToday {
            Text(day)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(width: geometry.size.width - 6, height: geometry.size.height - 3, alignment: .center)
                .font(.system(size: 12))
        } else {
            Text(day)
                .frame(width: geometry.size.width - 6, height: geometry.size.height - 3, alignment: .center)
                .font(.system(size: 12))
        }
    }
    .padding(.leading, 5)
}
