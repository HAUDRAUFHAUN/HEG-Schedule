//
//  Nav.swift
//  HEG Schedule
//
//  Created by Dietrich Poensgen on 25.05.21.
//

import SwiftUI

struct Nav: View {
    var body: some View {
        NavigationView {
            List{
                NavigationLink(destination: Home() ){Label("Home", systemImage: "house")}
      
                NavigationLink(destination: News()) {Label("News", systemImage: "network")}
              
                NavigationLink(destination: VPlan()) {Label("Vertretungsplan", systemImage: "calendar.badge.clock")}
            } .navigationTitle("HEG Schedule")
        }
      
    }
}

struct Nav_Previews: PreviewProvider {
    static var previews: some View {
        Nav()
    }
}
