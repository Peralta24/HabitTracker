//
//  CheckBoxView.swift
//  HabitTracker
//
//  Created by Jose Rafael Peralta Martinez  on 19/11/25.
//

import SwiftUI

struct CheckBoxView: View {
    @Binding var checked : Bool
    var body: some View {
        Image(systemName: checked ? "checkmark.square.fill" : "square")
            .resizable()
            .frame(width: 24, height: 24)
            .foregroundColor(checked ? .green : .gray)
            .onTapGesture {
                checked.toggle()
            }
    }
}

