//
//  Nav.swift
//  HEG Schedule
//
//  Created by Dietrich Poensgen on 25.05.21.
//

import SwiftUI

struct Nav: View {
    @State private var selectedView: Int? = 0
    
    // get the value from the local storage to show SettingsScreen view if value is nil
    @State private var username = UserDefaults.standard.string(forKey: "name_preference")
    
    var body: some View {
        NavigationView {
            List{
                NavigationLink(destination: Home(), tag: 1, selection: $selectedView){Label("Home", systemImage: "house")}
      
                NavigationLink(destination: News(), tag: 2, selection: $selectedView) {Label("News", systemImage: "network")}
              
                NavigationLink(destination: VPlan(), tag: 3, selection: $selectedView) {Label("Vertretungsplan", systemImage: "calendar.badge.clock")}
                
                NavigationLink(destination: SettingsScreen(), tag: 4, selection: $selectedView) {Label("Einstellungen", systemImage: "gear")}
            }.navigationTitle("HEG Schedule")
        }.onAppear{
            let device = UIDevice.current
            if device.model == "iPad"{
                if(username == nil) {
                    self.selectedView = 4
                } else {
                    self.selectedView = 1
                }
            } else {
                if(username == nil) {
                    self.selectedView = 4
                } else {
                    self.selectedView = 0
                }
            }
        }
    }
}

struct Nav_Previews: PreviewProvider {
    static var previews: some View {
        Nav()
    }
}
