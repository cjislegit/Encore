//
//  ContentView.swift
//  Encore
//
//  Created by Carlos Ramirez on 9/26/26.
//

import SwiftUI

struct AttendedView: View {
    @State private var shows: [Show] = []
    var body: some View {
        
        NavigationStack {
            List(shows) { show in
                Text(show.arsistName)
            }
            .navigationTitle("Attended")
            .toolbar{
                Button("Add Show!", systemImage: "plus") {
                    shows.append(Show(arsistName: "PTV", venueName: "The Form", city: "LA", date: .now, status: .attended))
                }
            }
        }
    }
}

#Preview {
    AttendedView()
}
