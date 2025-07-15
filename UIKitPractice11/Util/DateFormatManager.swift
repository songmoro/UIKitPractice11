//
//  DateFormatManager.swift
//  UIKitPractice11
//
//  Created by 송재훈 on 7/14/25.
//

import Foundation

class DateFormatManager {
    let getStringFrom: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyMMdd"
        return dateFormatter
    }()
    let getDateFrom: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy년 MM월 dd일"
        return dateFormatter
    }()
}
