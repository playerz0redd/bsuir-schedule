//
//  GroupScheduleViewModel.swift
//  bsuir-schedule
//
//  Created by Pavel Playerz0redd on 27.05.25.
//

import Foundation

class GroupScheduleViewModel: ObservableObject {
    private let model = GroupScheduleModel()
    @Published var group: Int = 351004
    @Published var semesterInfo: SemesterInfo?
    @Published var schedule: [WeekSchedule]?
    var currentWeek: Int?
    
    /// [day] -> day, [subjects], weekNumber
    
    init() {
        Task {
            await lauch()
        }
    }
    
    @MainActor
    func lauch() async {
        var rawSchedule: GroupScheduleEntity?
        do {
            rawSchedule = try await model.getGroupSchedule(group: self.group)
        } catch {
            print("error")
            return
        }
        
        guard let rawSchedule = rawSchedule else { return }
        
        self.semesterInfo = .init(
            start: rawSchedule.startDate.formatted(),
            end: rawSchedule.endDate.formatted(),
            examStart: rawSchedule.examStart.formatted(),
            examEnd: rawSchedule.examEnd.formatted()
        )
        
        var weekSchedule = [WeekSchedule]()
        
        for (day, schedule) in rawSchedule.schedules.allDays {
            var daySchedule: [ScheduleRow] = []
            for item in schedule {
                daySchedule.append(
                    .init(
                        subject: item.subject,
                        startTime: item.startLessonTime.formatted(),
                        endTime: item.endLessonTime.formatted(),
                        teacher: (item.employees.first?.firstName ?? "")
                                 + " " + (item.employees.first?.lastName ?? ""),
                        subGroup:  item.numSubgroup != 0 ? "subgroup: \(item.numSubgroup)" : "",
                        location: item.auditories.first ?? "",
                        lessonType: item.lessonType,
                        weekNumber: "\(item.weekNumber)"
                    )
                )
            }
            
            weekSchedule.append(.init(
                weekNumber: daySchedule.last?.weekNumber ?? "",
                dayName: day,
                schedule: daySchedule)
            )
        }
        
        self.schedule = weekSchedule
        do {
            self.currentWeek = try await model.getCurentWeek()
        } catch {
            print("error")
        }
    }
    
}
