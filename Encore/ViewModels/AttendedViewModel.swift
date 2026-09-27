//
//  AttendedViewModel.swift
//  Encore
//
//  Created by Carlos Ramirez on 9/26/26.
//
//View Model holds a state that belongs to a screen not a state that belongs to a view.
// This is for the attended screen

import Foundation
import SwiftData

@Observable //So swift tracks changes
final class AttendedViewModel {
    var searchText = ""
    var showingAddSheet = false
    
    func filteredShows(_ shows: [Show]) -> [Show] {
        let attended = shows.filter({ $0.status == .attended })
        guard !searchText.isEmpty else { return attended}
        return attended.filter {
            $0.arsistName.localizedCaseInsensitiveContains(searchText) || $0.venueName.localizedCaseInsensitiveContains(searchText) || $0.city.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    func delete(_ show: Show, context: ModelContext) {
        context.delete(show)
    }
}
