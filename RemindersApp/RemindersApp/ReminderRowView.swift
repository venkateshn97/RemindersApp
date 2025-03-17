//
//  ReminderRowView.swift
//  RemindersApp
//
//  Created by Venky on 3/13/25.
//

import SwiftUI

struct ReminderRowView: View {
    var reminder: Reminder
    @ObservedObject var viewModel: ReminderViewModel

    var body: some View {
        HStack {
            Button(action: {
                viewModel.toggleCompletion(reminder)
            }) {
                Image(systemName: reminder.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(reminder.isCompleted ? .green : .gray)
            }

            VStack(alignment: .leading) {
                Text("\(reminder.emoji) \(reminder.title)")
                    .font(.headline)
                    .strikethrough(reminder.isCompleted, color: .gray)
                Text("Due: \(reminder.dueDate.formatted(date: .abbreviated, time: .omitted))")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
    }
}

