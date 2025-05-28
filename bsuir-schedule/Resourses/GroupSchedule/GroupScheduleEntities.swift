//
//  GroupScheduleEntities.swift
//  bsuir-schedule
//
//  Created by Pavel Playerz0redd on 28.05.25.
//

import Foundation

struct SemesterInfo {
    let start: String
    let end: String
    let examStart: String
    let examEnd: String
}

struct ScheduleRow: Identifiable {
    let id = UUID()
    let subject: String
    let startTime: String
    let endTime: String
    let teacher: String
    let subGroup: String
    let location: String
    let lessonType: String
    let weekNumber: String
}

struct WeekSchedule: Identifiable {
    let id = UUID()
    let weekNumber: String
    let dayName: String
    let schedule: [ScheduleRow]
}
