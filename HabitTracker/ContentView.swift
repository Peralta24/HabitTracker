//
//  ContentView.swift
//  HabitTracker
//
//  Created by Jose Rafael Peralta Martinez  on 19/11/25.
//

import SwiftUI
class PathStore {
    var path : NavigationPath {
        didSet {
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init(){
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoded)
                return
            }
        }
        
        path = NavigationPath()
    }
    
    func save(){
        guard let representations = path.codable else {return}
        do {
            let data = try? JSONEncoder().encode(representations)
            try data?.write(to: savePath)
            
        }catch {
            print("Failed to save path")
        }
    }
}

@Observable
class Habits {
    private let saveKey = "SavedHabitsKey"
    var habits: [Habit] = [] {
        didSet {
            saveHabits()
        }
    }

    init(){
        loadHabits()
    }
    
    func addHabit(_ habit: Habit) {
        if habit.name.isEmpty { return }
        habits.append(habit)
    }
    
    func saveHabits() {
        UserDefaults.standard.setCodable(habits, forkey: saveKey)
    }
    func loadHabits(){
        if let saved : [Habit] = UserDefaults.standard.codableObject([Habit].self, forkey: saveKey){
            habits = saved
        }else {
            habits = []
        }
    }
    
    func removeHabit(at offsets: IndexSet) {
        habits.remove(atOffsets: offsets)
    }
}

struct ContentView: View {
    @State var habits = Habits()
    @State private var showForm = false
    @State private var pathStore = PathStore()
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            ZStack {
                // Fondo
                Color(red: 0.96, green: 0.95, blue: 0.90)
                    .ignoresSafeArea()
                
                // Contenido encima del fondo
                List {
                                    ForEach(habits.habits) { habit in
                                        NavigationLink {
                                            DetailHabitView(habit: habit, habits: habits)
                                        } label: {
                                            HStack {
                                                VStack(alignment: .leading){
                                                    Text(habit.name)
                                                        .font(.headline)
                                                        // Tachamos el texto si está hecho (detalle visual extra)
                                                        .strikethrough(habit.isDone)
                                                        .foregroundColor(habit.isDone ? .gray : .primary)
                                                    
                                                    Text(habit.description)
                                                        .font(.caption)
                                                }
                                                Spacer()
                                                
                                                // Contador histórico
                                                Text("\(habit.completionCount)")
                                                    .font(.caption.weight(.bold))
                                                    .padding(6)
                                                    .background(.gray.opacity(0.2))
                                                    .clipShape(Circle())
                                                
                                                // TU CHECKBOX RECUPERADO
                                                // Usamos Image directamente para manejar el tap manualmente
                                                Image(systemName: habit.isDone ? "checkmark.square.fill" : "square")
                                                    .resizable()
                                                    .frame(width: 24, height: 24)
                                                    .foregroundColor(habit.isDone ? .green : .gray)
                                                    .onTapGesture {
                                                        // Aquí aplicamos la lógica del reto para tu checkbox
                                                        toggleHabit(habit)
                                                    }
                                            }
                                        }
                                    }
                                    .onDelete(perform: habits.removeHabit)
                                }
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add",systemImage: "plus") {
                        showForm.toggle()
                    }
                }
            }

            
        }
        .sheet(isPresented: $showForm) {
            AddHabitView(habits: habits)
        }
    }
    // Lógica manual para el Checkbox (Cumple el requisito del reto)
       func toggleHabit(_ habit: Habit) {
           if let index = habits.habits.firstIndex(of: habit) {
               var newHabit = habit
               newHabit.isDone.toggle()
               
               // Opcional: Si lo marcas como hecho, aumentamos el contador automáticamente
               if newHabit.isDone {
                   newHabit.completionCount += 1
               } else {
                   // Si lo desmarcas, restamos 1 (para corregir errores)
                   newHabit.completionCount = max(0, newHabit.completionCount - 1)
               }
               
               habits.habits[index] = newHabit
           }
       }
}

#Preview {
    ContentView()
}
