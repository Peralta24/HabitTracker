//
//  UserDefaultsSave.swift
//  HabitTracker
//
//  Created by Jose Rafael Peralta Martinez  on 19/11/25.
//

import Foundation

extension UserDefaults {
    func setCodable<T: Codable>(_ object: T, forkey key: String) {
        if let data = try? JSONEncoder().encode(object){
            self.set(data, forKey: key)
        }else {
            print("Error al codificiar objetos par UserDefaults")
        }
    }
    
    
    func codableObject<T: Codable>(_ type: T.Type, forkey key: String) -> T? {
        guard let data = data(forKey: key) else { return nil }
        
        if let object = try? JSONDecoder().decode(type, from: data){
            return object
        }else {
            print("Error al decodificar objeto desde UserDefaults")
            return nil
        }
    }
}
