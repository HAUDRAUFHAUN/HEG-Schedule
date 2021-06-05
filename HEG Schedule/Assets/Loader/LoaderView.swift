//
//  LoaderView.swift
//  HEG Schedule
//
//  Created by Dietrich Poensgen on 04.06.21.
//


import SwiftUI


struct LoaderView: View {
    // MARK:- variables
    @State var animateLoaders: Bool = false
    
    // MARK:- views
    var body: some View {
        ZStack {
            Color("loaderBackground")
                .edgesIgnoringSafeArea(.all)
            ZStack {
                Loader(loaderState: .down, timerDuration: 0.35, startAnimating: $animateLoaders)
                Loader(loaderState: .right, timerDuration: 1.05, startAnimating: $animateLoaders)
                Loader(loaderState: .up, timerDuration: 1.75, startAnimating: $animateLoaders)
            }.offset(x: -40, y: -40)
        }.onAppear() {
            self.animateLoaders.toggle()
        }
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
