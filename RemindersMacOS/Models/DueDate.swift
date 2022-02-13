//
//  DueDate.swift
//  RemindersMacOS
//
//  Created by David Malicke on 2/13/22.
//

import Foundation

enum DueDate {
    case today
    case tomorrow
    case yesterday
    case custom(Date)
}
