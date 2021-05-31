//
//  LoadingSpinner.swift
//  HEG Schedule
//
//  Created by Dietrich Poensgen on 31.05.21.
//

import SwiftUI

struct LoadingSpinner: View {
    @State private var spinXLarge = false
    @State private var spinLarge = false
    @State private var spinMedium = false
    @State private var spinSmall = false
    @State private var spinXSmall = false
    
    var body: some View {
                VStack(alignment: .leading, spacing: 50) {
                    HStack {
                        Circle() // Large
                        .trim(from: 1/4, to: 1)
                            .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                            .foregroundColor(Color("darkBlue"))
                            .frame(width: 32, height: 32)
                        .rotationEffect(.degrees(spinLarge ? 360 : 0))
                        .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                        .onAppear() {
                            self.spinLarge.toggle()
                        }
                    }
                    
                    }}
}

struct LoadingSpinner_Previews: PreviewProvider {
    static var previews: some View {
        LoadingSpinner()
    }
}
