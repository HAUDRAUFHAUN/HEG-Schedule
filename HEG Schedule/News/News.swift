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
                NewsItem(title: (rssFeed?.items![0].title) as! String, date: (rssFeed?.items![0].pubDate) as! Date, link: (rssFeed?.items![0].link) as! String)
                NewsItem(title: (rssFeed?.items![1].title) as! String, date: (rssFeed?.items![1].pubDate) as! Date, link: (rssFeed?.items![1].link) as! String)
                NewsItem(title: (rssFeed?.items![2].title) as! String, date: (rssFeed?.items![2].pubDate) as! Date, link: (rssFeed?.items![2].link) as! String)
                NewsItem(title: (rssFeed?.items![3].title) as! String, date: (rssFeed?.items![3].pubDate) as! Date, link: (rssFeed?.items![3].link) as! String)
                NewsItem(title: (rssFeed?.items![4].title) as! String, date: (rssFeed?.items![4].pubDate) as! Date, link: (rssFeed?.items![4].link) as! String)
                NewsItem(title: (rssFeed?.items![5].title) as! String, date: (rssFeed?.items![5].pubDate) as! Date, link: (rssFeed?.items![5].link) as! String)
                NewsItem(title: (rssFeed?.items![6].title) as! String, date: (rssFeed?.items![6].pubDate) as! Date, link: (rssFeed?.items![6].link) as! String)
                NewsItem(title: (rssFeed?.items![7].title) as! String, date: (rssFeed?.items![7].pubDate) as! Date, link: (rssFeed?.items![7].link) as! String)
                NewsItem(title: (rssFeed?.items![8].title) as! String, date: (rssFeed?.items![8].pubDate) as! Date, link: (rssFeed?.items![8].link) as! String)
                NewsItem(title: (rssFeed?.items![9].title) as! String, date: (rssFeed?.items![9].pubDate) as! Date, link: (rssFeed?.items![9].link) as! String)
            }} else {
                LoadingSpinner()
            }
        }.onAppear(perform: loadData).navigationTitle("News")
    }
    
    func loadData() {
        let feedUrl: URL = URL(string: "https://heg-uelzen.de/hpp/rss.xml")!
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
