//
//  UserDefaultsManager.swift
//  RemindersApp
//
//  Created by Venky on 3/13/25.
//

import Foundation

struct UserDefaultsManager {
    static let key = "reminders"

    static func saveReminders(_ reminders: [Reminder]) {
        if let encoded = try? JSONEncoder().encode(reminders) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }

    static func loadReminders() -> [Reminder] {
        if let data = UserDefaults.standard.data(forKey: key),
           let decoded = try? JSONDecoder().decode([Reminder].self, from: data) {
            return decoded
        }
        return []
    }
}

