//
//  Home.swift
//  HEG Schedule
//
//  Created by Dietrich Poensgen on 25.05.21.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            VStack {
                NavigationLink(destination: News()) {Label("News", systemImage: "network")}.padding()
              
                NavigationLink(destination: VPlan()) {Label("Vertretungsplan", systemImage: "calendar.badge.clock")}.padding()
            }
        }.navigationTitle("Home")
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
