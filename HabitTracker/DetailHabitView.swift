//
//  DetailHabitView.swift
//  HabitTracker
//
//  Created by Jose Rafael Peralta Martinez  on 19/11/25.
//

import SwiftUI

struct DetailHabitView: View {
    var habit: Habit
    var habits: Habits
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing : 20) {
                HStack {
                    Text(habit.name)
                        .font(.largeTitle.bold())
                    Spacer()
                    
                    if habit.isDone {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundStyle(.green)
                            .font(.title)
                    }
                }
                
                Text(habit.description)
                    .font(.body)
                
                Divider()
                
                Text("Estadisticas")
                    .font(.headline)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Total completado:")
                        Text("\(habit.completionCount)")
                            .font(.largeTitle)
                            .foregroundStyle(.blue)
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("Estado hoy:")
                        Text(habit.isDone ? "Completado" : "Pendiente")
                            .foregroundStyle(habit.isDone ? .green : .orange)
                            .fontWeight(.bold)
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                
                //Boton
                Button(action: incrementHabit) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Registrar completado (+1)")
                    }
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .disabled(habit.isDone)
                Spacer()
            }
            .padding()
            .navigationTitle(habit.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func incrementHabit() {
        var newHabit = habit
        newHabit.completionCount += 1
        newHabit.isDone = true
        
        if let index = habits.habits.firstIndex(of: habit){
            habits.habits[index] = newHabit
        }
    }
}


#Preview {
    DetailHabitView(
        habit: Habit(
            name: "Leer 10 minutos",
            description: "Leer antes de dormir",
            isDone: false
        ),
        habits: Habits()
    )
}
