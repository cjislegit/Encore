//
//  EncoreApp.swift
//  Encore
//
//  Created by Carlos Ramirez on 9/26/26.
//

import SwiftUI
import SwiftData

@main
struct EncoreApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
        .modelContainer(for: Show.self)
    }
}
