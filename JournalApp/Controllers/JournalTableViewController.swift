//
//  JournalTableViewController.swift
//  JournalApp
//
//  Created by Ivan Dedic on 2024-08-29.
//

import UIKit

class JournalTableViewController: UITableViewController {
    
    @IBOutlet weak var btnEdit: UIButton!
    
    let journalCell = "journalCell"

    
    var journalData: Journal? = nil
    


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      


        
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
       
        /*let cell = tableView.dequeueReusableCell(withIdentifier: journalCell, for: indexPath) */
        
        let cell = tableView.dequeueReusableCell(withIdentifier: journalCell) as! CustomTableViewCell

        // sätter vaiabel content till cells default inehåll
       // var content = cell.defaultContentConfiguration()
        
        if let journalData = journalData
         {
            
            let entry = journalData.getEntry(atIndex: indexPath.row)
           
            // Ändra på innehållet.text till Hej
            
            cell.lblTitle.text = entry?.title
            
            // Sätter cellens content till nya updaterade content.text
            // cell.contentConfiguration = content
            // #selector referear till metod som ska köras -> objective C kod
            cell.btnEdit.tag = indexPath.row
            cell.btnEdit.addTarget(self, action: #selector(editButtonsWasTapped(sender:)), for: .touchUpInside)
            cell.btnRemove.tag = indexPath.row
            cell.btnRemove.addTarget(self, action: #selector(removeButtonsWasTapped(sender:)), for: .touchUpInside)
            

            
        }
        
        return cell
       
        
       
    }
    
    
    
    @objc
    func removeButtonsWasTapped(sender: UIButton) {
        
        // Gör något med datan på "row index" sender = btnRemove?
        let rowIndex: Int = sender.tag
        
            
            guard let journalData = journalData
            else  { return }
        
            
        if let entry = journalData.getEntry(atIndex: rowIndex) {
           
            print(rowIndex)
            print(journalData.getEntries().count)
            
            journalData.deleteEntryByID(id: entry.id)
            
            print(rowIndex)
            print(journalData.getEntries().count)
            
         tableView.reloadData()
            
         //tableView.deleteRows(at: [IndexPath(row: rowIndex, section: 0)], with: .automatic)
           
        }
           // print(journalData.getEntries())
    
    }
    
   
    @objc
    func editButtonsWasTapped(sender: UIButton) {
        
        // Gör något med datan på "row index"
        let rowIndex: Int = sender.tag
        
        print(rowIndex)
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
