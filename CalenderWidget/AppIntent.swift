//
//  AppIntent.swift
//  CalenderWidget
//
//  Created by 한재형 on 11/23/23.
//

import AppIntents
import WidgetKit

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")
}
