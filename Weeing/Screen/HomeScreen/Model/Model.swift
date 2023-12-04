//
//  Model.swift
//  Weeing
//
//  Created by 한재형 on 12/2/23.
//

import Foundation
import Moya

struct TimeTable: Codable {
    var hisTimetable: [HisTimetable]?

    struct HisTimetable: Codable {
        var row: [Row]?

        struct Row: Codable {
            var ITRT_CNTNT: String
            var PERIO: String
        }
    }
}
