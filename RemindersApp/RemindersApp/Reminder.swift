//
//  Reminder.swift
//  RemindersApp
//
//  Created by Venky on 3/13/25.
//

import Foundation

struct Reminder: Identifiable, Codable {
    var id: UUID = UUID()
    var title: String
    var dueDate: Date
    var category: String
    var emoji: String
    var isCompleted: Bool = false
}

