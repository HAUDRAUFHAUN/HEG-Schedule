//
//  NewsItem.swift
//  HEG Schedule
//
//  Created by Dietrich Poensgen on 27.05.21.
//

import SwiftUI

struct NewsItem: View {
    @State var title: String!
    @State var date: Date!
    @State var link: String!
    
    
    var body: some View {
        Link(destination: URL(string: link)!){
            
            HStack {
                Text(title).bold()
                Text(date, style: .date).italic()
            }.frame(width: .greatestFiniteMagnitude, alignment: .leading).padding().multilineTextAlignment(.leading)}
        }
    }


struct NewsItem_Previews: PreviewProvider {
    static var previews: some View {
        NewsItem(title: "", date: Date(), link: "")
            .environment(\.locale, Locale(identifier: "de"))
    }
}
