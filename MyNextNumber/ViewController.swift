//
//  ViewController.swift
//  MyNextNumber
//
//  Created by Etienne Sabatier on 18/06/2015.
//  Copyright (c) 2015 TakeItEasy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func buttonPushed(sender: UIButton) {
        
        
        if let askNumberController = self.storyboard?.instantiateViewControllerWithIdentifier("AskNumberViewController") as? AskNumberViewController {

            self.presentViewController(askNumberController, animated: true, completion: nil)
        }
        
    }


}

