//
//  GroupScheduleVIew.swift
//  bsuir-schedule
//
//  Created by Pavel Playerz0redd on 27.05.25.
//

import SwiftUI

struct GroupScheduleView: View {
    @StateObject var viewModel = GroupScheduleViewModel()
    
    var body: some View {
        VStack {
            Text("351004")
                .frame(maxWidth: .infinity, alignment: .leading)
            
            makeSchedule()
        }
        
    }
    
    @ViewBuilder
    func makeSchedule() -> some View {
        ScrollView {
            ForEach(viewModel.schedule ?? [], id: \.id) { week in
                LazyVStack(pinnedViews: [.sectionHeaders]) {
                    Section {
                        ForEach(week.schedule, id: \.id) { lesson in
                            HStack {
                                Text(lesson.subject)
                                Text(lesson.subGroup)
                                Text(lesson.lessonType)
                            }
                        }
                    } header: {
                        Text(week.dayName)
                            .foregroundStyle(Color.red)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }

        }
        .scrollIndicators(.hidden)
    }
}

