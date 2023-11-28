//
//  CalenderWidgetLiveActivity.swift
//  CalenderWidget
//
//  Created by 한재형 on 11/23/23.
//

import ActivityKit
import SwiftUI
import WidgetKit

struct CalenderWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var emoji: String
    }

    var name: String
}

struct CalenderWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: CalenderWidgetAttributes.self) { context in
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

private extension CalenderWidgetAttributes {
    static var preview: CalenderWidgetAttributes {
        CalenderWidgetAttributes(name: "World")
    }
}

private extension CalenderWidgetAttributes.ContentState {
    static var smiley: CalenderWidgetAttributes.ContentState {
        CalenderWidgetAttributes.ContentState(emoji: "😀")
    }

    static var starEyes: CalenderWidgetAttributes.ContentState {
        CalenderWidgetAttributes.ContentState(emoji: "🤩")
    }
}

#Preview("Notification", as: .content, using: CalenderWidgetAttributes.preview) {
    CalenderWidgetLiveActivity()
} contentStates: {
    CalenderWidgetAttributes.ContentState.smiley
    CalenderWidgetAttributes.ContentState.starEyes
}
