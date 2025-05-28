//
//  GroupScheduleEntities.swift
//  bsuir-schedule
//
//  Created by Pavel Playerz0redd on 27.05.25.
//

import Foundation

struct GroupScheduleEntity: Decodable {
    let startDate: Date
    let endDate: Date
    let examStart: Date
    let examEnd: Date
    
    let schedules: Schedules
    
    enum CodingKeys: String, CodingKey {
        case startDate
        case endDate
        case examStart = "startExamsDate"
        case examEnd = "endExamsDate"
        case schedules
    }
}

struct Schedules: Decodable {
    let monday: [Schedule]
    let tuesday: [Schedule]
    let wednesday: [Schedule]
    let thursday: [Schedule]
    let friday: [Schedule]
    let saturday: [Schedule]
    
    enum CodingKeys: String, CodingKey {
        case monday = "Понедельник"
        case tuesday = "Вторник"
        case wednesday = "Среда"
        case thursday = "Четверг"
        case friday = "Пятница"
        case saturday = "Суббота"
    }
    
    var allDays: [(day: String, schedule: [Schedule])] {
        return [
            ("Понедельник", monday),
            ("Вторник", tuesday),
            ("Среда", wednesday),
            ("Четверг", thursday),
            ("Пятница", friday),
            ("Суббота", saturday)
        ]
    }
    
}

struct Schedule: Decodable {
    let weekNumber: [Int]
    let numSubgroup: Int
    let auditories: [String]
    let startLessonTime: Date
    let endLessonTime: Date
    let subject: String
    let lessonType: String
    let employees: [Employee]

    enum CodingKeys: String, CodingKey {
        case weekNumber
        case numSubgroup
        case auditories
        case startLessonTime
        case endLessonTime
        case subject
        case lessonType = "lessonTypeAbbrev"
        case employees
    }
    
}

struct Employee: Decodable {
    let firstName: String
    let middleName: String
    let lastName: String
    let photoLink: String
}
