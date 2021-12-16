//
//  ViewController.swift
//  Bucket List
//
//  Created by لمياء فالح الدوسري on 10/05/1443 AH.
//

import UIKit
import CoreData




class bucketListViewController: UITableViewController ,addIteamTableViewController{
    
var Tasks=[TheItems]()
    
    let context=(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetcAllItem()
        

    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text=Tasks[indexPath.row].text!
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // performSegue(withIdentifier: "editSegue", sender:  indexPath)

    }
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "editSegue", sender:  indexPath)
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let Task = Tasks[indexPath.row]
        context.delete(Task)
        
        do{
       try context.save()
        }catch{
            print(error)
        }
        
        Tasks.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if sender is UIBarButtonItem{
            let nc=segue.destination as! UINavigationController
            let addtableVew = nc.topViewController as! addTableViewController
            addtableVew.delegate=self
        }else {
    
            let nc=segue.destination as! UINavigationController
            let addtableVew = nc.topViewController as! addTableViewController
            addtableVew.delegate=self
            let indexPath = sender as! NSIndexPath
            let item = Tasks[indexPath.row]
            addtableVew.taskItem = item.text
            addtableVew.indexPath = indexPath
            
        }
        
      /*  if segue.identifier == "addSegue"{
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
            
        }*/
        
    }
    func cancleButtonPreesed(by controller: addTableViewController ) {
        dismiss(animated: true, completion: nil)
    }
    func saveItem (by controller: addTableViewController,with Text: String , at indexPath:NSIndexPath?) {
        if let ip = indexPath{
          //  Task[ip.row] = text with out CourData
            let Task = Tasks[ip.row]
            Task.text = Text
            
        }else{
            let Task = NSEntityDescription.insertNewObject(forEntityName:"TheItems", into: context) as! TheItems
            Task.text = Text
            Tasks.append(Task)
        }
       
        do{
       try context.save()
        }catch{
            print(error)
        }
        
        
        tableView.reloadData()
       /// print("\(text)")
        dismiss(animated: true, completion: nil)

    }
    
    func fetcAllItem(){
        let request=NSFetchRequest<NSFetchRequestResult>(entityName: "TheItems")
        do{
        let result = try context.fetch(request)
        Tasks = result as! [TheItems]
        }catch{
            print(error)
        }
    }
    
    
}


