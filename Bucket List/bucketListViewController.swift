//
//  ViewController.swift
//  Bucket List
//
//  Created by لمياء فالح الدوسري on 10/05/1443 AH.
//

import UIKit

class bucketListViewController: UITableViewController ,addIteamTableViewController{
var Task=["task1","task2","task3"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("loded")
        // Do any additional setup after loading the view.
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Task.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text=Task[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // performSegue(withIdentifier: "editSegue", sender:  indexPath)

    }
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "editSegue", sender:  indexPath)
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        Task.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addSegue"{
            let nc=segue.destination as! UINavigationController
            let addtableVew = nc.topViewController as! addTableViewController
            addtableVew.delegate=self
        }else if segue.identifier == "editSegue"{
            let nc=segue.destination as! UINavigationController
            let addtableVew = nc.topViewController as! addTableViewController
            addtableVew.delegate=self
            let indexPath = sender as! NSIndexPath
            let item = Task[indexPath.row]
            addtableVew.taskItem = item
            addtableVew.indexPath = indexPath
            
        }
        
    }
    func cancleButtonPreesed(by controller: addTableViewController ) {
        dismiss(animated: true, completion: nil)
    }
    func saveItem(by controller: addTableViewController,with text: String , at indexPath:NSIndexPath?) {
        if let ip = indexPath{
            Task[ip.row] = text
            
        }else{
            Task.append("\(text)")
        }
       
        tableView.reloadData()
       /// print("\(text)")
        dismiss(animated: true, completion: nil)

    }
}



struct task{
    
    var taskes=["task1","task2","task3"]
}

