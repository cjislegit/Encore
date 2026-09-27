//
//  Show.swift
//  Encore
//
//  Created by Carlos Ramirez on 9/26/26.
//

import Foundation //Use for dates
import SwiftData

//String gives each case a text value: ShowStatus.attended.rawValue is "attended".
//Codable lets Swift encode and decode the enum in formats like JSON—for example, saving "attended" and reading it back as .attended.
//CaseIterable provides a list of all cases: ShowStatus.allCases is [.attended, .upcoming].

enum ShowStatus: String, Codable, CaseIterable {
    case attended
    case upcoming
}

@Model
final class Show {
    var arsistName: String
    var venueName: String
    var city: String
    var date: Date
    var status: ShowStatus
    
    var rating: Int?
    var notes: String?
    var setlist: [String]
    var createdAt: Date
    
    init(arsistName: String, venueName: String, city: String, date: Date, status: ShowStatus) {
        self.arsistName = arsistName
        self.venueName = venueName
        self.city = city
        self.date = date
        self.status = status
        //Setting the dafult values of optional items
        self.rating = nil
        self.notes = nil
        self.setlist = []
        self.createdAt = .now
    }
}
