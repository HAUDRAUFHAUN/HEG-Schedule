//
//  NewsItem.swift
//  HEG Schedule
//
//  Created by Dietrich Poensgen on 27.05.21.
//

import SwiftUI
import FeedKit
import Foundation

struct NewsItem: View {
    @State var feedItem: RSSFeedItem
    
    //dateFormatter.locale = Locale(identifier: "de-DE")
    
    
    var body: some View {
        Link(destination: URL(string: feedItem.link!)!){
            VStack {
                HStack{
                    Text(feedItem.title!).bold().foregroundColor(Color("NewsItemTextColor")).multilineTextAlignment(.leading)
                    Spacer()
                }
                HStack {
                    Text(formatDateDE(dateToFormat: feedItem.pubDate!)).italic().foregroundColor(Color("NewsItemTextColor")).multilineTextAlignment(.leading)
                    Spacer()
                }.padding(.init(top: 2, leading: 0, bottom: 0, trailing: 0))
            }.frame(alignment: .leading).padding().multilineTextAlignment(.leading)
        }
    }
    
    func formatDateDE(dateToFormat: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        
        dateFormatter.locale = Locale(identifier: "de-DE")
        
        let newDate = dateFormatter.string(from: dateToFormat)
        return newDate
    }
}


struct NewsItem_Previews: PreviewProvider {
    static var previews: some View {
        NewsItem(feedItem: RSSFeedItem())
            .environment(\.locale, Locale(identifier: "de"))
    }
}
