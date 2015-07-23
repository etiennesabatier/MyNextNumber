//
//  ListAllViewController.swift
//  MyNextNumber
//
//  Created by Etienne Sabatier on 17/07/2015.
//  Copyright (c) 2015 TakeItEasy. All rights reserved.
//

import Foundation
import UIKit

class ListAllViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var listAllTableView: UITableView!
    var items : [String] = ["item 1", "item 2", "item 3"]
    let kCellIdentifier: String = "myCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.listAllTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "myCell")
            //=> done already in the storyboard
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier) as! UITableViewCell
        cell.textLabel?.text = self.items[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){

    }

    

    
}
