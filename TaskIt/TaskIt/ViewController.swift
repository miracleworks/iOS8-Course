//
//  ViewController.swift
//  TaskIt
//
//  Created by SHITAL DESAI on 6/9/15.
//  Copyright (c) 2015 miracle-works.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var baseArray:[[TaskModel]] = []
    
    // Loads first time only
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let date1 = Date.from(year: 2014, month: 05, day: 20)
        let date2 = Date.from(year: 2014, month: 03, day: 3)
        let date3 = Date.from(year: 2014, month: 12, day: 13)
        
        let task1 = TaskModel(task: "Study French", subTask: "Verbs", date: date1, isCompleted: false)
        let task2 = TaskModel(task: "Eat Dinner", subTask: "Burgers", date: date2, isCompleted: false)
        
        let taskArray = [task1,task2, TaskModel(task: "Gym", subTask: "Leg Day", date: date3, isCompleted: false)]
        
        var completedArray = [TaskModel(task: "Code", subTask: "Task Project", date: date2, isCompleted: true)]
        
        baseArray = [taskArray, completedArray] //Add array to array of arrays
        
        tableView.reloadData()
    }
    
    // Load everytime main ViewController loads
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidDisappear(animated)
        
        //func sortByDate(taskOne: TaskModel, taskTwo: TaskModel) -> Bool
        //{
        //    return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
        //}
        //taskArray = taskArray.sorted(sortByDate)
        
        // Closure
        baseArray[0] = baseArray[0].sorted{
            (taskOne: TaskModel, taskTwo: TaskModel) -> Bool in
            // comparison logic here
            return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
        }
        
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // --------------------------------------------------------------------------
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showTaskDetail"
        {
            let detailVC: TaskDetailViewController = segue.destinationViewController as TaskDetailViewController // Get destination ViewController
            let indexPath = self.tableView.indexPathForSelectedRow() // Get selected row index
            let thisTask = baseArray[indexPath!.section][indexPath!.row]
            
            detailVC.detailTaskModel = thisTask
            detailVC.mainVC = self
            detailVC.indexPath = indexPath!.row
            
        }
        else if segue.identifier == "showTaskAdd"
        {
            let addTaskVC:AddTaskViewController = segue.destinationViewController as AddTaskViewController
            
            addTaskVC.mainVC = self
        }
    }
    
    
    // UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return baseArray.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return baseArray[section].count
    }
    
    // Something similar to GridView.OnItemDataBound
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //println(indexPath.row)
        
        let thisTask = baseArray[indexPath.section][indexPath.row]
        
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subTask
        cell.dateLabel.text = Date.toString(date: thisTask.date)
        
        return cell
    }
    
    // UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //println(indexPath.row)
        
        performSegueWithIdentifier("showTaskDetail", sender: self)
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0
        {
            return "To do"
        }
        else
        {
            return "Completed"
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let thisTask = baseArray[indexPath.section][indexPath.row] // Find task that was swipped
        
        
        if indexPath.section == 0 // To do section
        {
            var newTask = TaskModel(task: thisTask.task, subTask: thisTask.subTask, date: thisTask.date, isCompleted: true) // Mark task completed
            baseArray[1].append(newTask) // Add task to completed section
            
        }
        else // completed section
        {
            var newTask = TaskModel(task: thisTask.task, subTask: thisTask.subTask, date: thisTask.date, isCompleted: false) // Mark taks uncompleted
            baseArray[0].append(newTask) // Add task to to do section
        }
        
        
        
        baseArray[indexPath.section].removeAtIndex(indexPath.row) // Remove completed task from To do section        
        tableView.reloadData() // Refresh
    }
    
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("showTaskAdd", sender: self)
    }
    
    // Helpers
    
}

