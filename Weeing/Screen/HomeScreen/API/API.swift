//
//  API.swift
//  Weeing
//
//  Created by 한재형 on 12/2/23.
//

import Foundation
import Moya

enum GetTimeTable {
    case getTimeTable
}

extension GetTimeTable: TargetType {
    var baseURL: URL {
        return URL(string: "https://open.neis.go.kr/hub/hisTimetable?KEY=5f6e46f771b746f4b874756a6d7617e5&Type=json&pIndex=1&pSize=8&ATPT_OFCDC_SC_CODE=F10&SD_SCHUL_CODE=7380292&ALL_TI_YMD=20231204&GRADE=1&CLRM_NM=4")!
    }

    var path: String {
        switch self {
        case .getTimeTable:
            return ""
        }
    }

    var method: Moya.Method {
        switch self {
        case .getTimeTable:
            return .get
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case .getTimeTable:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
