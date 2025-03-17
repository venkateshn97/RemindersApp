//
//  AddRemindView.swift
//  RemindersApp
//
//  Created by Venky on 3/13/25.
//

import SwiftUI

struct AddEditReminderView: View {
    @ObservedObject var viewModel: ReminderViewModel
    @State private var title: String = ""
    @Environment(\.dismiss) var dismiss
    @State private var dueDate: Date = Date()
    @State private var category: String = "Personal"
    @State private var selectedEmoji: String = "📌"
    
    let categories = ["Personal", "Work", "Shopping", "Health"]
    let emojis = ["📌", "🏡", "💼", "🛒", "💊"]

    var body: some View {
        Form {
            Section(header: Text("Reminder Details")) {
                TextField("Title", text: $title)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
            }

            Section(header: Text("Category")) {
                Picker("Select Category", selection: $category) {
                    ForEach(categories, id: \.self) { category in
                        Text(category)
                    }
                }
            }

            Section(header: Text("Emoji")) {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(emojis, id: \.self) { emoji in
                            Text(emoji)
                                .font(.largeTitle)
                                .padding()
                                .onTapGesture { selectedEmoji = emoji }
                        }
                    }
                }
            }
            
            Button("Save Reminder") {
                let newReminder = Reminder(title: title, dueDate: dueDate, category: category, emoji: selectedEmoji)
                viewModel.addReminder(newReminder)
                dismiss()
            }
        }
        .navigationTitle("New Reminder")
    }
}
