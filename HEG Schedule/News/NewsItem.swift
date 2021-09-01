//
//  NewsItem.swift
//  HEG Schedule
//
//  Created by Dietrich Poensgen on 27.05.21.
//

import SwiftUI
import FeedKit

struct NewsItem: View {
    @State var feedItem: RSSFeedItem
    
    var body: some View {
        Link(destination: URL(string: feedItem.link!)!){
            VStack {
                HStack{
                    Text(feedItem.title!).bold().foregroundColor(.black).multilineTextAlignment(.leading)
                    Spacer()
                }
                HStack {
                    Text(feedItem.pubDate!, style: .date).italic().foregroundColor(.black).multilineTextAlignment(.leading)
                    Spacer()
                }.padding(.init(top: 2, leading: 0, bottom: 0, trailing: 0))
            }.frame(alignment: .leading).padding().multilineTextAlignment(.leading)
        }
        }
    }


struct NewsItem_Previews: PreviewProvider {
    static var previews: some View {
        NewsItem(feedItem: RSSFeedItem())
            .environment(\.locale, Locale(identifier: "de"))
    }
}
