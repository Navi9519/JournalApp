//
//  JournalTableViewController.swift
//  JournalApp
//
//  Created by Ivan Dedic on 2024-08-29.
//

import UIKit

class JournalTableViewController: UITableViewController {
    
    
    let journalCell = "journalCell"

    
    var journalData: Journal? = nil
    


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    
        
        
        print(journalData?.getEntries())

        
    }

    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if let journalData = journalData {
            
            return journalData.getEntries().count
            
        } else {
            return 0
        }
                
        
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: journalCell, for: indexPath)

        // sätter vaiabel content till cells default inehåll
        var content = cell.defaultContentConfiguration()
        
        if let journalData = journalData
         {
            
            let entry = journalData.getEntry(atIndex: indexPath.row)
           
            // Ändra på innehållet.text till Hej
            content.text = entry?.title
            
           
            
            // Sätter cellens content till nya updaterade content.text
            cell.contentConfiguration = content

            
        }
        
        return cell
       
        
        
        
       
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
