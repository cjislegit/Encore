//
//  ShowRowView.swift
//  Encore
//
//  Created by Carlos Ramirez on 9/27/26.
//

import SwiftUI

struct ShowRowView: View {
    let show: Show
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(show.arsistName)
                .font(.headline)
            
            HStack(spacing: 4) {
                Text(show.venueName)
                Text("-")
                Text(show.city)
            }
            .font(.subheadline)
            .foregroundStyle(.secondary)
            
            HStack {
                Text(show.date.formatted(date: .abbreviated, time: .omitted))
            }
        }
    }
}

#Preview {
    ShowRowView(show: Show(arsistName: "MCR", venueName: "Hollywood Bowl", city: "Hollywood", date: .now, status: .attended))
}
