//
//  notesTableViewController.swift
//  manjinder_c0762203_note_P1
//
//  Created by Manjinder Aulakh on 2019-11-11.
//  Copyright © 2019 Manjinder kaur. All rights reserved.
//

import UIKit

class notesTableViewController: UITableViewController {

    var counter : Int?
    @IBOutlet weak var Enablebtn: UIBarButtonItem!
    @IBOutlet weak var trashvar: UIBarButtonItem!
    
    @IBOutlet weak var MoveVar: UIBarButtonItem!
    
    var selectedrows : [String]?
    
    var notes : [String]?
    var curIndex = -1
        override func viewDidLoad() {
            super.viewDidLoad()

            // Uncomment the following line to preserve selection between presentations
            // self.clearsSelectionOnViewWillAppear = false

            // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
            // self.navigationItem.rightBarButtonItem = self.editButtonItem
        // MARK: - Table view data source
    notes = []
            trashvar.isEnabled = false
            MoveVar.isEnabled = false
            
        }
        override func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return notes?.count ?? 0
            // #warning Incomplete implementation, return the number of rows
           
        }
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let arrayname = notes?[indexPath.row]
            {

            if let cell = tableView.dequeueReusableCell(withIdentifier: "note")
            {
                cell.textLabel?.text = arrayname
                cell.accessoryType = .detailButton
            cell.backgroundColor = .lightGray
            return cell
        
                }
            } 
            return UITableViewCell()
    }
    
   
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        let i = notes![indexPath.row]
        selectedrows?.append(i)
    }
    
    

    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .detailButton
    }
  
    
    
   
    @IBAction func Enablebtn(_ sender: UIBarButtonItem) {
        if  trashvar.isEnabled == false && MoveVar.isEnabled == false{
                    trashvar.isEnabled = true
                   MoveVar.isEnabled = true
        }
       else  if trashvar.isEnabled == true &&  MoveVar.isEnabled == true{
            trashvar.isEnabled = false
            MoveVar.isEnabled = false
        }
    }
    
     
    
    @IBAction func Trashcells(_ sender: Any) {
        
        let alertcontroller = UIAlertController(title: "Delete ", message: "Are you sure", preferredStyle: .alert)
               
               let CancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
               CancelAction.setValue(UIColor.brown, forKey: "titleTextColor")
               let trashItemAction = UIAlertAction(title: "Delete", style: .default)
               {
                   (action) in
                
                if let selectedRows = self.tableView.indexPathsForSelectedRows {
             
                var items = [String]()
                for indexPath in selectedRows  {
                    items.append(self.notes![indexPath.row])
                }
                for item in items {
                    if let index = self.notes?.index(of: item) {
                        self.notes?.remove(at: index)
                    }
                }
                    self.tableView.deleteRows(at: selectedRows, with: .automatic)
                    self.tableView.reloadData()
                }
                }
                             trashItemAction.setValue(UIColor.red, forKey: "titleTextColor")
                             alertcontroller.addAction(CancelAction)
                             alertcontroller.addAction(trashItemAction)
                             self.present(alertcontroller, animated: true, completion: nil)
           }
        
        
        
    
    
    
        /*
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

            // Configure the cell...

            return cell
        }
        */

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

        
    
        // MARK: - Navigation

        // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let detailView = segue.destination as? TaskdetailViewController {
                detailView.tasktable = self
                if let tableviewcell = sender as? UITableViewCell {
                           if let index = tableView.indexPath(for: tableviewcell)?.row {
                               detailView.textString = notes![index]
                               curIndex = index
                           }
                       }
            }
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
    
    
    
    
   func updateText(text : String){
    if curIndex != -1 && notes != nil {
       notes![curIndex] = text
        let indexPath = IndexPath(item: curIndex, section: 0)
        tableView.reloadRows(at: [indexPath], with: .none)
        curIndex = -1
    }
    else if notes != nil && curIndex == -1 {
         notes?.append(text)
         tableView.reloadData()
    }
   
    }
    
    }


