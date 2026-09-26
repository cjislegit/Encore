//
//  Show.swift
//  Encore
//
//  Created by Carlos Ramirez on 9/26/26.
//

import Foundation //Use for dates

enum ShowStatus {
    case attended
    case upcoming
}

struct Show: Identifiable {
    var arsistName: String
    var venueName: String
    var city: String
    var date: Date
    var status: ShowStatus
    let id = UUID()
}
