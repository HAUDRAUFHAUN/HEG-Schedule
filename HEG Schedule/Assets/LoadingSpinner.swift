//
//  LoadingSpinner.swift
//  HEG Schedule
//
//  Created by Dietrich Poensgen on 31.05.21.
//

import SwiftUI

struct LoadingSpinner: View {
    let style = StrokeStyle(lineWidth: 5, lineCap: .round)
    @State var animate = false
    let color1 = Color("darkBlue")
    let color2 = Color("darkBlue").opacity(0.5)
    
    
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .trim(from: 0, to: 0.7)
                    .stroke(
                        AngularGradient(gradient: .init(colors: [color1, color2]), center: .center),
                        style: style)
                    .rotationEffect(Angle(degrees: animate ? 360 : 0))
                    .animation(Animation.linear(duration: 0.7).repeatForever(autoreverses: false))
            }.onAppear(){
                self.animate.toggle()
            }.frame(width: 40, height: 40, alignment: .center)
        }
    }
}

struct LoadingSpinner_Previews: PreviewProvider {
    static var previews: some View {
        LoadingSpinner()
    }
}
