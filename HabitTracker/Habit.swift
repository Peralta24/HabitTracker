//
//  Habit.swift
//  HabitTracker
//
//  Created by Jose Rafael Peralta Martinez  on 19/11/25.
//

import Foundation

struct Habit : Codable,Identifiable, Hashable, Equatable {
    var id = UUID()
    var name: String
    var description: String
    var isDone: Bool
    
    var completionCount: Int = 0
}
