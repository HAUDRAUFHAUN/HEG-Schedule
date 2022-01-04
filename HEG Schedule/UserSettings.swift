//
//  UserSettings.swift
//  HEG Schedule
//
//  Created by Dietrich Poensgen on 02.01.22.
//

import Foundation
import Combine

class UserSettings: ObservableObject {
    // MARK: Setting for the username
    @Published var username: String {
        didSet {
            UserDefaults.standard.set(username, forKey: "name_preference")
        }
    }
    
    // MARK: Setting for the Users class (-> course)
    @Published var course: String {
           didSet {
               UserDefaults.standard.set(course, forKey: "class_preference")
           }
       }
    // available class options
       public var courses = ["5a", "5b", "5c", "5d", "5e", "6a","6b","6c","6d","6e","7a","7b","7c","7d","8a","8b","8c","8d","9a","9b","9c","9d","10a","10b","10c","10d","11a","11b","11c","11d"]
    
    // initialization of the ObservablaObject `UserSettings`
    init() {
        self.username = UserDefaults.standard.string(forKey: "name_preference") ?? ""
        self.course = UserDefaults.standard.object(forKey: "class_preference") as? String ?? "5a"
    }
    
}
