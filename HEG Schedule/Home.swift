//
//  Home.swift
//  HEG Schedule
//
//  Created by Dietrich Poensgen on 25.05.21.
//

import SwiftUI
import Liquid

struct Home: View {
    private let greetings = ["Willkommen", "Welcome", "Bienvenue", "Servus", "Moin"]
    var body: some View {
        VStack {
            ZStack {
                        Liquid()
                            .frame(width: 240, height: 240)
                            .foregroundColor(Color("darkBlue"))
                            .opacity(0.3)


                        Liquid()
                            .frame(width: 220, height: 220)
                            .foregroundColor(Color("darkBlue"))
                            .opacity(0.6)

                        Liquid(samples: 5)
                            .frame(width: 200, height: 200)
                            .foregroundColor(Color("darkBlue"))
                        
                Text(greetings.randomElement()!).font(.largeTitle).foregroundColor(.white)
                    }
        }.navigationTitle("Home")
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
