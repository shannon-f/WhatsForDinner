//
//  DateToDayFormatter.swift
//  WhatsForDinner
//
//  Created by Shannon Fluellen on 5/22/20.
//  Copyright © 2020 Shannon Fluellen. All rights reserved.
//

import Foundation

extension Date {
    func toDayOfTheWeek() -> String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "EEEE"
           let dayOfWeekString = dateFormatter.string(from: self)
           return dayOfWeekString
    }
}
