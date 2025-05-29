//
//  DecodeService.swift
//  bsuir-schedule
//
//  Created by Pavel Playerz0redd on 27.05.25.
//

import Foundation

class DecodeService {
    
    func decode<ApiEntity: Decodable>(from data: Data) throws(AppError) -> ApiEntity? {
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        let formats = ["dd.MM.yyyy", "HH:mm"]
        formatter.locale = Locale(identifier: "ru_RU")
        
        decoder.dateDecodingStrategy = .custom({ decoder -> Date in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)
            for format in formats {
                formatter.dateFormat = format
                if let date = formatter.date(from: dateString) {
                    return date
                }
            }
            throw AppError.invalidData
        })
        
        do {
            let decodedData = try decoder.decode(ApiEntity.self, from: data)
            return decodedData
        } catch {
            throw .invalidData
        }
    }
}
