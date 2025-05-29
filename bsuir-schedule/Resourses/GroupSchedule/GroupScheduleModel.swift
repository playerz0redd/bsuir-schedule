//
//  GroupScheduleModel.swift
//  bsuir-schedule
//
//  Created by Pavel Playerz0redd on 27.05.25.
//

import Foundation

class GroupScheduleModel {
    private let networkManager = NetworkManager()
    private let decoder = DecodeService()
    
    private func fetchRawGroupSchedule(group: Int) async throws(AppError) -> Data? {
        let url = ApiURLs.groupSchedule.rawValue + "\(group)"
        return try await networkManager.fetchData(url: url, with: .get)
    }
    
    func getGroupSchedule(group: Int) async throws(AppError) -> GroupScheduleEntity? {
        guard let data = try await fetchRawGroupSchedule(group: group) else { return nil }
        return try decoder.decode(from: data)
    }
    
    func getCurentWeek() async throws(AppError) -> Int? {
        guard let data = try await networkManager.fetchData(
            url: ApiURLs.currentWeek.rawValue,
            with: .get
        ) else { return nil }
        
        return try decoder.decode(from: data)
    }
    
    func getTeacherPhoto(from url: String) async throws(AppError) -> Data? {
        return try await networkManager.fetchData(url: url, with: .get)
    }
}
