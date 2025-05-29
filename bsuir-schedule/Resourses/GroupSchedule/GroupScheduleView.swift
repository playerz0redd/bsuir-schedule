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
                .font(.system(size: 26) .weight(.bold))
                .background(.white)
            
            makeSchedule()
        }
        .padding(.horizontal, 15)
    }
    
    @ViewBuilder
    func makeSchedule() -> some View {
        ScrollView {
            
            ForEach(viewModel.schedule ?? [], id: \.id) { week in
                LazyVStack(pinnedViews: [.sectionHeaders]) {
                    Section {
                        ForEach(week.schedule, id: \.id) { lesson in
                            VStack {
                                HStack {
                                    VStack {
                                        Text(lesson.startTime)
                                        Text(lesson.endTime)
                                    }
                                    Text(lesson.subject)
                                    Text(lesson.subGroup)
                                    Text(lesson.lessonType)
                                    Text(lesson.weekNumber)
                                    
                                    Spacer()
                                    
                                    if let image = viewModel.teacherPhotos[lesson.teacher], image != nil {
                                        Image(uiImage: image!)
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                            .clipShape(Circle())
                                    }
                                }
                                
                                Divider()
                            }
                        }
                    } header: {
                        Text(week.dayName)
                            .foregroundStyle(Color.red)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 10)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(.blue)
                            }
                    }
                }
            }
            
        }
        .scrollIndicators(.hidden)
    }
}

