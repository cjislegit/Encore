//
//  UpcomingViewModel.swift
//  Encore
//
//  Created by Carlos Ramirez on 9/27/26.
//

import Foundation
import SwiftData

@Observable
final class UpcomingViewModel {
    var showingAddSheet = false
    
    func filteredShows(_ shows: [Show]) -> [Show] {
        shows
            .filter { $0.status == .upcoming }
            .sorted { $0.date < $1.date }
    }
    
    func delete(_ show: Show, context: ModelContext) {
        context.delete(show)
    }
}
