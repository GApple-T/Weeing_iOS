import SwiftUI
import SwiftUICalendar

@ViewBuilder func calenderday(day: String) -> some View{
    GeometryReader { geometry in
        Text(day)
            .frame(width: geometry.size.width-6, height: geometry.size.height-3, alignment: .center)
            .font(.system(size: 12))
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    .padding(.leading, 5)
}
