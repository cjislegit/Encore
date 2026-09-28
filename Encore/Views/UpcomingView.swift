//
//  UpcomingView.swift
//  Encore
//
//  Created by Carlos Ramirez on 9/26/26.
//

import SwiftUI
import SwiftData

struct UpcomingView: View {
    @Query(sort: \Show.date) private var allShows: [Show]
    @Environment(\.modelContext) private var modelContext
    @State private var viewModel = UpcomingViewModel()
    var body: some View {
        @Bindable var vm = viewModel
         
        NavigationStack {
            Group {
                if viewModel.filteredShows(allShows).isEmpty {
                    ContentUnavailableView("No Upcoming Shows", systemImage: "calendar")
                } else {
                    List {
                        ForEach(viewModel
                            .filteredShows(allShows)) { show in
                                NavigationLink(value: show) {
                                    ShowRowView(show: show)
                                }
                            }
                            .onDelete { IndexSet in
                                let shows = viewModel.filteredShows(allShows)
                                for index in IndexSet {
                                    viewModel.delete(shows[index], context: modelContext)
                                }
                            }
                    }
                }
            }
            .navigationTitle("Upcoming")
            .navigationDestination(for: Show.self) { show in
                //ShowDetailView
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Add Show", systemImage: "plus") {
                        viewModel.showingAddSheet = true
                    }
                }
            }
            .sheet(isPresented: $vm.showingAddSheet) {
                AddEditShowView()
            }
        }
    }
}

#Preview {
    UpcomingView()
}
