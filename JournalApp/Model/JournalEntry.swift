//
//  JournalEntry.swift
//  JournalApp
//
//  Created by Ivan Dedic on 2024-08-29.
//

import Foundation



struct JournalEntry {
    
    var id = UUID().uuidString
    var title: String
    var notes: String
    var date: Date
    var updatedAt: Date?
    
}
