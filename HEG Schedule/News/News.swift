//
//  News.swift
//  HEG Schedule
//
//  Created by Dietrich Poensgen on 26.05.21.
//

import SwiftUI
import FeedKit


struct News: View {
    @State var rssFeed: RSSFeed?
    
    var body: some View {
        VStack{
            if((rssFeed?.items!) != nil){
                List {
                    NewsItem(feedItem: (rssFeed?.items![0])!)
                    NewsItem(feedItem: (rssFeed?.items![1])!)
                    NewsItem(feedItem: (rssFeed?.items![2])!)
                    NewsItem(feedItem: (rssFeed?.items![3])!)
                    NewsItem(feedItem: (rssFeed?.items![4])!)
                    NewsItem(feedItem: (rssFeed?.items![5])!)
                    NewsItem(feedItem: (rssFeed?.items![6])!)
                    NewsItem(feedItem: (rssFeed?.items![7])!)
                    NewsItem(feedItem: (rssFeed?.items![8])!)
                    NewsItem(feedItem: (rssFeed?.items![9])!)
            }} else {
               LoaderView()
            }
        }.onAppear(perform: loadData).navigationTitle("News")
    }
    
    func loadData() {
        let feedUrl: URL = URL(string: "https://www.heg-uelzen.de/?feed=rss")!
        let parser = FeedParser(URL: feedUrl)
        
        parser.parseAsync { (result) in
                  switch result {
                  case .success(let feed):
                      // Grab the parsed feed directly as an optional rss, atom or json feed object
                    rssFeed = feed.rssFeed!
                  case .failure(let error):
                      print(error)
                  }
              }
    }
}

struct News_Previews: PreviewProvider {
    static var previews: some View {
        News()
    }
}
