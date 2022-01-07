//
//  VPlan.swift
//  HEG Schedule
//
//  Created by Dietrich Poensgen on 29.05.21.
//

import SwiftUI
import SwiftUIRefresh


struct VPlan: View {
    @State private var isShowing = false
    @State var results = [Timetable]()
    
    @AppStorage("timetable", store: UserDefaults(suiteName: "group.Dietrich-Poensgen.HEG-Schedule"))
    var timetableData: Data = Data()
    
    var body: some View {
        VStack{
            if(results.count > 0){
                List(results) { item in
                    VPlanItem(timetabledata: item)
                }.pullToRefresh(isShowing:  $isShowing, onRefresh: loadPlans)} else {
                LoaderView()
            }}.onAppear(perform: {
                loadPlans()
            }).navigationTitle("Vertretungspläne")
    }
    
    func loadPlans(){
        guard let url = URL(string: "https://hegschedule-server.vercel.app/") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    if let response = try? JSONDecoder().decode([Timetable].self, from: data) {
                        DispatchQueue.main.async {
                            self.results = response
                            self.timetableData = data
                        }
                        return
                    }
                }
            }.resume()
        self.isShowing = false
    }
}

struct VPlan_Previews: PreviewProvider {
    static var previews: some View {
        VPlan()
    }
}
