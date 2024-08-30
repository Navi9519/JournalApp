//
//  Journal.swift
//  JournalApp
//
//  Created by Ivan Dedic on 2024-08-29.
//

import Foundation


class Journal {
    
    
    // Gör entries bara tillgänglig denna klass
  private var entries: [JournalEntry] = []
    
    
    func addEntriy(title: String, notes: String, date: Date?) {
        
        let newEntry = JournalEntry(title: title, notes: notes, date: date ?? Date())
        
        entries.append(newEntry)
        
    }
    
    // Hämta alla anteckningar 
    func getEntries() -> [JournalEntry] {
        
        return entries
    }
    
    // Hämta en anteckning som har ett visst id
    func getEntryById(id: String) -> JournalEntry? {
        
        let maybeFoundEntry = entries.first() {$0.id == id }
    
        return maybeFoundEntry

    }
    
    
    // Hämta en anteckning vid en viss Index
    func getEntry(atIndex: Int) -> JournalEntry? {
        
    return entries[atIndex]
       
    }
    
    
    func deleteEntryByID(id: String) {
        
        entries.removeAll {$0.id == id}
        
      /*  let updatedEntries = entries.filter($0.id != id)
        
        entries = updatedEntries */
        
        
        
    }
    
    // !!!! KOLLA DEN HÄR !!!! /// för guard let och if let förståelse -> Kolla video också 11:35 
    func updateEntrysById(id: String, title: String?, notes: String?) {
        
        var optionalEntry = entries.first {$0.id == id}
        
        guard var foundEntry = optionalEntry else {return}
        
        if let title = title {
            foundEntry.title = title
        }
        
        if let notes = notes {
            foundEntry.notes = notes
        }
        
        
        foundEntry.updatedAt = Date()
        
        
    }
    
    
    
    
    
    
    
    
}
