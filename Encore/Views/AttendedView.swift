//
//  ContentView.swift
//  Encore
//
//  Created by Carlos Ramirez on 9/26/26.
//

import SwiftUI
import SwiftData

struct AttendedView: View {
    @Query(sort: \Show.date, order: .reverse) private var allShows: [Show] //Reads from the store. If the Store change the result is refreshed
    
    @Environment(\.modelContext) private var modelContext //This lets us write to the store
    
    @State private var viewModel = AttendedViewModel()
    
    var body: some View {
        @Bindable var vm = viewModel
        
        NavigationStack {
            Group {
                if viewModel.filteredShows(allShows).isEmpty {
                    ContentUnavailableView("No Results", systemImage: "magnifyingglass")
                } else {
                    List {
                        ForEach(viewModel.filteredShows(allShows)) { show in
                            Text(show.arsistName)
                        }
                        .onDelete { indexSet in
                            let shows = viewModel.filteredShows(allShows)
                            for index in indexSet {
                                viewModel.delete(shows[index], context: modelContext)
                            }
                        }
                    }
                }
                
            }
            .navigationTitle("Attended")
            .searchable(text: $vm.searchText, prompt: "Artists, Venus, Cities")
            .toolbar{
                Button("Add Show!", systemImage: "plus") {
                    //Inserts the new Show to the modelContext
                    viewModel.showingAddSheet = true
                }
            }
        }
    }
}

#Preview {
    AttendedView()
}
