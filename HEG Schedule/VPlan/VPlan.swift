//
//  VPlan.swift
//  HEG Schedule
//
//  Created by Dietrich Poensgen on 29.05.21.
//

import SwiftUI


struct Timetable: Codable, Identifiable {
    let id = UUID()
    let title: String
    let url: String
    let date: String
    let preview: String
    let secondTitle: String
}

struct VPlan: View {
    @State var results = [Timetable]()
    
    var body: some View {
        VStack{
            if(results.count > 0){
                List(results) { item in
                    VPlanItem(timetabledata: item)
            }} else {
                LoadingSpinner() 
            }}.onAppear(perform: {
                loadPlans()
            }).navigationTitle("Vertretungspläne")
    }
    
    func loadPlans(){
        guard let url = URL(string: "https://hegschedule-server-haudraufhaun.vercel.app/") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    if let response = try? JSONDecoder().decode([Timetable].self, from: data) {
                        DispatchQueue.main.async {
                            self.results = response
                        }
                        return
                    }
                }
            }.resume()
    }
}

struct VPlan_Previews: PreviewProvider {
    static var previews: some View {
        VPlan()
    }
}
