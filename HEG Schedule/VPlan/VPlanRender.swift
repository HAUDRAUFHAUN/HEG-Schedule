//
//  VPlanRender.swift
//  HEG Schedule
//
//  Created by Dietrich Poensgen on 30.05.21.
//

import SwiftUI
import WebKit

struct HTMLTableView: UIViewRepresentable {
    @State var htmlLink: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let myURL = URL(string:htmlLink)
        let myRequest = URLRequest(url: myURL!)
        uiView.load(myRequest)
    }
}


struct VPlanRender: View {
    @State var timetabledetails: Timetable?
    
    var body: some View {
        VStack{
            HTMLTableView(htmlLink: timetabledetails!.url).frame(maxWidth: .infinity, maxHeight: .infinity)
        }.frame(maxWidth: .infinity, maxHeight: .infinity).navigationTitle(timetabledetails!.title)
    }
}

struct VPlanRender_Previews: PreviewProvider {
    static var previews: some View {
        VPlanRender(timetabledetails: Timetable(title: "", url: "", date: "", preview: "", secondTitle: ""))
    }
}
