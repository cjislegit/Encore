//
//  MainTabView.swift
//  Encore
//
//  Created by Carlos Ramirez on 9/26/26.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Tab("Attended", systemImage: "music.mic") {
                AttendedView()
            }
            
            Tab("Upcoming", systemImage: "calendar") {
                UpcomingView()
            }
            
            Tab("Settings", systemImage: "gear") {
                SettingsView()
            }
        }
    }
}

//#Preview {
//    MainTabView()
//}
