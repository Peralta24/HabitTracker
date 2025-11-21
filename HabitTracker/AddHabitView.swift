//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Jose Rafael Peralta Martinez on 19/11/25.
//

import SwiftUI

struct AddHabitView: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var habits : Habits
    @State private var nameHabit = ""
    @State private var description = ""
    @State private var isDone = false
    
    var body: some View {
        ZStack {
            // Fondo azul
            Color(red: 0.45, green: 0.55, blue: 0.65)
                .ignoresSafeArea()
            
            Form {
                Section("Add new habit") {
                    TextField("Enter the name", text: $nameHabit)
                    TextField("Description", text: $description)
                    Toggle("Already done today?",isOn: $isDone)
                }

                
                Button("Add to the list") {
                    let initialCount = isDone ? 1 : 0
                    let newHabit = Habit(
                                            name: nameHabit,
                                            description: description,
                                            isDone: isDone, completionCount: initialCount
                                        )
                    habits.addHabit(newHabit)
                    dismiss()
                }

            }

        }
    }
}

#Preview {
    AddHabitView(habits: Habits())
}

