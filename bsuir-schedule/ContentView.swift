//
//  ContentView.swift
//  bsuir-schedule
//
//  Created by Pavel Playerz0redd on 27.05.25.
//

import SwiftUI

struct ContentView: View {
    let model = GroupScheduleModel()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
            do {
                print(try await model.getCurentWeek())
                //try await model.getGroupSchedule(group: 351004)
            } catch {
                
            }
        }
    }
}

