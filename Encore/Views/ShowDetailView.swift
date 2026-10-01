//
//  ShowDetailView.swift
//  Encore
//
//  Created by Carlos Ramirez on 9/28/26.
//

import SwiftUI
import SwiftData

struct ShowDetailView: View {
    @Bindable var show: Show
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var showingEditSheet = false
    @State private var showDeleteAlert = false
    @State private var newSetlistEntry = ""
    var body: some View {
        List {
            Section("Show Info") {
                LabeledContent("Artist", value: show.artistName)
                LabeledContent("Venue", value: show.venueName)
                LabeledContent("City", value: show.city)
                LabeledContent("Date", value: show.date.formatted(date: .long, time: .omitted))
                LabeledContent("Status", value: show.status.rawValue.capitalized)
            }
            if show.status == .attended {
                Section("Rating") {
                    StarRatingView(rating: Binding(get: { show.rating ?? 0}, set: { show.rating = $0 > 0 ? $0 : nil}))
                        .padding(.vertical, 4)
                }
            }
        }
    }
}

//#Preview {
//    ShowDetailView()
//}
