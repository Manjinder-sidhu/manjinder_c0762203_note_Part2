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
    var curIndex = -1
    var folderitems : [String]?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        folders = [String]()
        
        
        self.tableView.backgroundColor =  . lightGray
        self.navigationItem.rightBarButtonItem = editButtonItem

        
         self.navigationController?.toolbar.barTintColor = UIColor.lightGray
    }

    @IBOutlet var tableviewdata: UITableView!
    
    
    
    @IBAction func newfolderbtn(_ sender: Any) {
        let alertcontroller = UIAlertController(title: "New Folder", message: "Enter a name for this folder", preferredStyle: .alert)
        
        alertcontroller.addTextField { (textField ) in
                        textField.placeholder = "name"
            textField.text = ""
        }
        let CancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        CancelAction.setValue(UIColor.brown, forKey: "titleTextColor")
        let AddItemAction = UIAlertAction(title: "Add Item", style: .default){
            (action) in
            let txtfield = alertcontroller.textFields![0]
            /// get the textfield instance form textFields array

             let i = txtfield.text

                if self.folders!.contains(i!){

                let alert2 = UIAlertController(title: " Name Taken", message: "Please choose a different name", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                    alert2.addAction(okAction)
                    self.present(alert2, animated: true, completion:  nil)

            }
                else {
                     self.folders!.append(i!)
            }
            self.tableviewdata.reloadData()
        }
                      AddItemAction.setValue(UIColor.black, forKey: "titleTextColor")
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
         // Configure the cell...
            
           if let cell = tableView.dequeueReusableCell(withIdentifier: "folderscell")
                {
                   let newitem = folders?[indexPath.row]
                    cell.textLabel?.text = newitem
                    cell.imageView?.image = UIImage(named: "folder-icon")
                    cell.backgroundColor = .lightGray
                    cell.detailTextLabel?.text = "0"
                    return cell
           
            }
            return UITableViewCell()
            }
   
      
    //remove round delete button
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if (self.tableView.isEditing){
            return .none
        }
        return  .delete
    }
    
    
    
   override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = UIColor.lightGray
    }
    
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

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    
//    if let detailView = segue.destination as? TaskdetailViewController{
//        detailView.tasktable = self
//        if let tableviewcell = sender as? UITableViewCell {
//            if let index = tableView.indexPath(for: tableviewcell)?.row {
//                detailView.textString = folderitems![index]
//                curIndex = index
//            }
//        }
//           }
//    
//    }
//    func updateText(text : String){
//        guard folderitems != nil && curIndex != -1 else {
//            return
//        }
//       folderitems![curIndex] = text
//        let indexPath = IndexPath(item: curIndex, section: 0)
//        tableView.reloadRows(at: [indexPath], with: .none)
//    }

   

}
