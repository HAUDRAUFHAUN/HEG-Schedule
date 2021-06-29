//
//  Home.swift
//  HEG Schedule
//
//  Created by Dietrich Poensgen on 25.05.21.
//

import SwiftUI
import Liquid

struct Home: View {
    private let greetings = ["Willkommen", "Welcome", "Bienvenue", "Servus", "Moin", "Hallo", "Hello", "Salut", "Hey", "Hej", "Ahoj"]
    @State private var username = UserDefaults.standard.string(forKey: "name_preference")
   
       
    var body: some View {
        VStack {
            ZStack {
                        Liquid()
                            .frame(width: 440, height: 340)
                            .foregroundColor(Color("darkBlue"))
                            .opacity(0.3)
                        Liquid()
                            .frame(width: 420, height: 320)
                            .foregroundColor(Color("darkBlue"))
                            .opacity(0.6)

                        Liquid(samples: 5)
                            .frame(width: 400, height: 300)
                            .foregroundColor(Color("darkBlue"))
                HStack {
                    Text(greetings.randomElement()!).font(.largeTitle).foregroundColor(.white)
                    if(username != nil) {
                        Text(username!).font(.largeTitle).foregroundColor(.white)
                    }
                }
            }
        }.navigationTitle("Home")
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
