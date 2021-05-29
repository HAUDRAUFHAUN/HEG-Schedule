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
            VStack {
                HStack{
                    Text(title).bold().multilineTextAlignment(.leading)
                    Spacer()
                }
                HStack {
                    Text(date, style: .date).italic().multilineTextAlignment(.leading)
                    Spacer()
                }.padding(.init(top: 2, leading: 0, bottom: 0, trailing: 0))
            }.frame(alignment: .leading).padding().multilineTextAlignment(.leading)
        }
        }
    }


struct NewsItem_Previews: PreviewProvider {
    static var previews: some View {
        NewsItem(title: "", date: Date(), link: "")
            .environment(\.locale, Locale(identifier: "de"))
    }
}
