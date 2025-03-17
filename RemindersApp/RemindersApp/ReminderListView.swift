//
//  ReminderListView.swift
//  RemindersApp
//
//  Created by Venky on 3/13/25.
//

import SwiftUI

struct ReminderListView: View {
    @StateObject var viewModel = ReminderViewModel()
    @State private var searchText = ""

    var filteredReminders: [Reminder] {
        if searchText.isEmpty {
            return viewModel.reminders
        } else {
            return viewModel.reminders.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(filteredReminders) { reminder in
                    ReminderRowView(reminder: reminder, viewModel: viewModel)
                }
                .onDelete(perform: viewModel.deleteReminder)
            }
            .navigationTitle("Reminders")
            .searchable(text: $searchText, prompt: "Search Reminders")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddEditReminderView(viewModel: viewModel)) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                    }
                }
            }
        }
    }
}

