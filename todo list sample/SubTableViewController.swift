//
//  SubTableViewController.swift
//  todo list sample
//
//  Created by 中村将大 on 2014/09/01.
//  Copyright (c) 2014年 masa. All rights reserved.
//

import UIKit

class SubTableViewController: UITableViewController {
    
    var editingToDoArray = [AnyObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        var nib = UINib(nibName: "SubTableViewCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "editCell")
        
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
        return 2
    }

    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("editCell", forIndexPath: indexPath) as SubTableViewCell
        
        let row = indexPath.row
        

        // Configure the cell...
        if (row == 0) {
            cell.titleLabel.text = "やること"
        } else {
            cell.titleLabel.text = "日付"
        }
        
        var formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        if (self.editingToDoArray[0] as Int != -1) {
            if (row == 0) {
                var str = self.editingToDoArray[1] as String
                cell.titleTextField.text = str
            } else {
                var date = self.editingToDoArray[2] as NSDate
                cell.titleTextField.text = formatter.stringFromDate(date)
            }
        } else {
            if (row == 1) {
                cell.titleTextField.text =  formatter.stringFromDate(NSDate())
            }
        }

        return cell
    }
    
    override func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        return SubTableViewCell.rowHeight()
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.

    }
    

}
