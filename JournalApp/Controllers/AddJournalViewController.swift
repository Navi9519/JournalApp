//
//  AddJournalViewController.swift
//  JournalApp
//
//  Created by Ivan Dedic on 2024-08-29.
//

import UIKit

class AddJournalViewController: UIViewController {
    
    let myJournal = Journal()
    let SegueToJournal = "SegueToJournal"
    
    @IBOutlet weak var titelTxt: UITextField!
    @IBOutlet weak var notesTxt: UITextField!
    @IBOutlet weak var dateTxt: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
      guard  let destinationJournal = segue.destination as? JournalTableViewController
        else { return }
        
        destinationJournal.journalData
        
        let data = myJournal
        
        destinationJournal.journalData = myJournal
        
        
    }
    
    
    
    
    // Actions
    
    
    @IBAction func btnAddEntry(_ sender: UIButton) {
        addJournalEntry()
        
        titelTxt.text = ""
        notesTxt.text = ""
    }
    
    
    @IBAction func btnNavigateJournal(_ sender: UIButton) {
        
        performSegue(withIdentifier: SegueToJournal, sender: self)
    }
    
    
    // Functions
    func addJournalEntry() {
        
        guard let title = titelTxt.text, !title.isEmpty,
              let notes = notesTxt.text, !notes.isEmpty
        else {
            return
        }
            
            myJournal.addEntry(title: title, notes: notes, date: Date() )
            //ä(myJournal.getEntries())
        
    }
    
    
    
    
}
    
    

