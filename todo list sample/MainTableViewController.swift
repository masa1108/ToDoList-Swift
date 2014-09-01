//
//  MainTableViewController.swift
//  todo list sample
//
//  Created by 中村将大 on 2014/09/01.
//  Copyright (c) 2014年 masa. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    var todoTitle = [String]()
    var todoDate = [NSDate]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.todoTitle.count
    }

    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("TodoCell", forIndexPath: indexPath) as UITableViewCell

        let row = indexPath.row
        
        var formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        formatter.timeZone = NSTimeZone(abbreviation: "JST")
        
        // Configure the cell...
        cell.textLabel.text = todoTitle[row]
        cell.detailTextLabel.text = formatter.stringFromDate(todoDate[row])

        return cell
    }
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
        var source = segue.sourceViewController as SubTableViewController
        var row = source.editingToDoArray[0] as Int
        var titleCell = source.tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0)) as SubTableViewCell
        var dateCell = source.tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 1, inSection: 0)) as SubTableViewCell
        
        var title = titleCell.titleTextField.text
        var formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        
        var date = formatter.dateFromString(dateCell.titleTextField.text)
        if date == nil {
            date = NSDate()
        }
        
        if (row != -1) {
            updateToDo((title, date!), AtIndex: row)
        } else {
            addNewToDo((title, date!))
        }

    }

    func addNewToDo(todo: (String, NSDate)) {
        self.todoTitle.insert(todo.0, atIndex: 0)
        self.todoDate.insert(todo.1, atIndex: 0)
        self.tableView.reloadData()
    }
    
    func updateToDo(todo: (String, NSDate), AtIndex i: Int) {
        self.todoTitle[i] = todo.0
        self.todoDate[i] = todo.1
        self.tableView.reloadData()
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            var row = indexPath.row
            self.todoTitle.removeAtIndex(row)
            self.todoDate.removeAtIndex(row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {
        var from = fromIndexPath.row
        var to = toIndexPath.row
        var name = self.todoTitle[from]
        var date = self.todoDate[from]
        
        self.todoTitle.removeAtIndex(from)
        self.todoDate.removeAtIndex(from)
        
        self.todoTitle.insert(name, atIndex: to)
        self.todoDate.insert(date, atIndex: to)
    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        var destination = segue.destinationViewController as SubTableViewController
        if (segue.identifier == "edit") {
            var editingRow = self.tableView.indexPathForSelectedRow().row
            destination.editingToDoArray = [editingRow, todoTitle[editingRow], todoDate[editingRow]]
        } else {
            destination.editingToDoArray = [-1]
        }
    }


}
