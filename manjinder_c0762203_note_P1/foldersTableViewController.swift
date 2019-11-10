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
    
    var scrollview: UIScrollView!
    var containerview = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        folders = [String]()
        
        
        self.tableView.backgroundColor =  . lightGray
        self.navigationItem.rightBarButtonItem = editButtonItem
        navigationItem.rightBarButtonItem?.tintColor = UIColor.black
        
         self.navigationController?.toolbar.barTintColor = UIColor.lightGray
//        navigationController?.navigationBar.isTranslucent = true
//        navigationController?.navigationBar.shadowImage = UIImage()
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
//        self.navigationItem.largeTitleDisplayMode =      self.navigationController?.navigationBar.prefersLargeTitles = true
        
//       let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 1000))
//       footerView.backgroundColor = bottomColor
//       self.tableView.tableFooterView?.addSubview(footerView)
//
//        self.navigationController?.navigationBar.barTintColor = .lightGray
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
            self.folders!.append(txtfield.text!)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
