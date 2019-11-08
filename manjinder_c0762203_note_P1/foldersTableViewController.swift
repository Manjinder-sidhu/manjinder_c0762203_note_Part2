//
//  foldersTableViewController.swift
//  manjinder_c0762203_note_P1
//
//  Created by Manjinder Aulakh on 2019-11-07.
//  Copyright © 2019 Manjinder kaur. All rights reserved.
//

import UIKit

class foldersTableViewController: UITableViewController {
    var folders: [String]?
    var mytextfield = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        folders = [String]()
        
        self.navigationItem.rightBarButtonItem = editButtonItem
    }

  
    
    @IBOutlet var tableviewdata: UITableView!
    
    @IBAction func newfolderbtn(_ sender: Any) {
        let alertcontroller = UIAlertController(title: "New Folder", message: "Enter a name for this folder", preferredStyle: .alert)
        
        
//        let action = UIAlertAction(title: "Name Input", style: .default) { (alertAction) in
//         textfield = alertcontroller.textFields![0] as UITextField
//        }
//
    
        alertcontroller.addTextField { (textField ) in
                        textField.placeholder = "name"
            textField.text = ""
        }
        let CancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        let AddItemAction = UIAlertAction(title: "Add Item", style: .default){
            
            (action) in
            let txtfield = alertcontroller.textFields![0]
            
           
            /// get the textfield instance form textFields array
            self.folders!.append(txtfield.text!)
            self.tableviewdata.reloadData()
            
        }
                      alertcontroller.addAction(CancelAction)
                      alertcontroller.addAction(AddItemAction)
                      self.present(alertcontroller, animated: true, completion: nil)
        
        
    }
    
      // MARK: - Table view data source

        override func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return folders?.count ?? 0
        }
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
           
            
           if let cell = tableView.dequeueReusableCell(withIdentifier: "folderscell")
                {
                   let newitem = folders?[indexPath.row]
                    cell.textLabel?.text = newitem
                    cell.imageView?.image = UIImage(named: "folder-icon")
                    
                    
                    return cell
                    
                
            // Configure the cell...
            }
            return UITableViewCell()
            }
    //}
        

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
   

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            folders?.remove(at: indexPath.row)
            tableviewdata.reloadData()
            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//         else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
   

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
