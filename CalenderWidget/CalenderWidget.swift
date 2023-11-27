//
//  CalenderWidget.swift
//  CalenderWidget
//
//  Created by 한재형 on 11/23/23.
//

import SwiftUI
import WidgetKit

struct Provider: AppIntentTimelineProvider {
    func placeholder(in _: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func snapshot(for _: ConfigurationAppIntent, in _: Context) async -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func timeline(for _: ConfigurationAppIntent, in _: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct CalenderWidgetEntryView: View {
    var entry: Provider.Entry

    @State var date = Date()
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en-US")
        formatter.setLocalizedDateFormatFromTemplate("d")
        return formatter
    }()

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(entry.date.formatted(.dateTime.weekday(.wide)))
                .font(.custom("AppleSDGothicNeoSB00", size: 16))
            Text(entry.date, formatter: CalenderWidgetEntryView.dateFormat)
                .font(.custom("AppleSDGothicNeoB00", size: 45))
                .padding(.top, -6)
            HStack(spacing: 0) {
                Circle()
                    .frame(width: 3, height: 3)
                    .foregroundStyle(Color.S30)
                    .padding(.trailing, 5)
                Text("상담일정이 없습니다")
                    .font(Font.custom("AppleSDGothicNeoSB00", size: 14))
            }
            .padding(.top, 10)
            Spacer()
        }
        .containerBackground(for: .widget) {
            Color.bg
        }
    }
}

struct CalenderWidget: Widget {
    let kind: String = "CalenderWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            CalenderWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .supportedFamilies([.systemSmall])
        .description("상담 예정 교시를 보여주는 위젯입니다.")
    }
}

// private extension ConfigurationAppIntent {
//    static var smiley: ConfigurationAppIntent {
//        let intent = ConfigurationAppIntent()
//        intent.favoriteEmoji = "😀"
//        return intent
//    }

//    static var starEyes: ConfigurationAppIntent {
//        let intent = ConfigurationAppIntent()
//        intent.favoriteEmoji = "🤩"
//        return intent
//    }
// }

#Preview(as: .systemSmall) {
    CalenderWidget()
} timeline: {
    SimpleEntry(date: .now)
    //    SimpleEntry(date: .now, configuration: .starEyes)
}
