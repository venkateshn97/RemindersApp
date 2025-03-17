//
//  ReminderViewModel.swift
//  RemindersApp
//
//  Created by Venky on 3/13/25.
//

import Foundation
import SwiftUI

class ReminderViewModel: ObservableObject {
    @Published var reminders: [Reminder] = []
    
    init() {
        loadReminders()
    }

    func addReminder(_ reminder: Reminder) {
        reminders.append(reminder)
        saveReminders()
    }

    func updateReminder(_ reminder: Reminder) {
        if let index = reminders.firstIndex(where: { $0.id == reminder.id }) {
            reminders[index] = reminder
            saveReminders()
        }
    }

    func deleteReminder(at offsets: IndexSet) {
        reminders.remove(atOffsets: offsets)
        saveReminders()
    }

    func toggleCompletion(_ reminder: Reminder) {
        if let index = reminders.firstIndex(where: { $0.id == reminder.id }) {
            reminders[index].isCompleted.toggle()
            saveReminders()
        }
    }

    func saveReminders() {
        UserDefaultsManager.saveReminders(reminders)
    }

    func loadReminders() {
        reminders = UserDefaultsManager.loadReminders()
    }
}

