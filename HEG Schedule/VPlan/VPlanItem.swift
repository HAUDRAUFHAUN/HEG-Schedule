//
//  VPlanItem.swift
//  HEG Schedule
//
//  Created by Dietrich Poensgen on 29.05.21.
//

import SwiftUI

struct VPlanItem: View {
    @State var timetabledata: Timetable?
    
    var body: some View {
        NavigationLink(destination: VPlanRender(timetabledetails: timetabledata)){
            VStack {
                HStack{
                    Text(timetabledata!.title).bold().multilineTextAlignment(.leading)
                    Spacer()
                }
                HStack {
                    Text(timetabledata!.date).italic().multilineTextAlignment(.leading)
                    Spacer()
                }.padding(.init(top: 2, leading: 0, bottom: 0, trailing: 0))
            }.frame(alignment: .leading).padding().multilineTextAlignment(.leading)
        }
    }
    
    
}

struct VPlanItem_Previews: PreviewProvider {
    static var previews: some View {
        VPlanItem(timetabledata: Timetable(title: "", url: "", date: "", preview: "", secondTitle: ""))
    }
}
