//
//  HEG_Widgets.swift
//  HEG-Widgets
//
//  Created by Dietrich Poensgen on 08.06.21.
//

import WidgetKit
import SwiftUI

struct TimetableEntry: TimelineEntry {
    let date = Date()
    
    let timetable: Timetable
}

struct Provider: TimelineProvider {
    @AppStorage("timetable", store: UserDefaults(suiteName: "group.Dietrich-Poensgen.HEG-Schedule"))
    var timetableData: Data = Data()
    
    func placeholder(in context: Context) -> TimetableEntry {
        let timetable = TimetableEntry(timetable: Timetable(id: UUID(), title: "No data available", url: "", date: "", preview: "", secondTitle: ""))
        
        return timetable
    }
    
    func getSnapshot(in context: Context, completion: @escaping (TimetableEntry) -> Void) {
        guard let timetable = try? JSONDecoder().decode(Timetable.self, from: timetableData) else { return }
        let entry = TimetableEntry(timetable: timetable)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<TimetableEntry>) -> Void) {
        guard let url = URL(string: "https://hegschedule-server-haudraufhaun.vercel.app/") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    if let response = try? JSONDecoder().decode([Timetable].self, from: data) {
                        DispatchQueue.main.async {
                            self.timetableData = data
                        }
                        return
                    }
                }
            }.resume()
    }
}

struct PlaceholderView: View {
    var body: some View {
            VPlanItem(timetabledata: Timetable(id: UUID(), title: "No data available", url: "", date: "", preview: "", secondTitle: ""))
    }
}

struct WidgetEntryView: View {
    let entry: Provider.Entry
    
    var body: some View {
        VPlanItem(timetabledata: entry.timetable)
    }
}

@main
struct VPlanWidget: Widget {
    private let kind = "HEG_Widgets"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Vertretungspläne")
        .description("Zeigt aktuell vorhandene Vertretungspläne an")
    }
}
