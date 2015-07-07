//
//  SecondViewController.swift
//  MyNextNumber
//
//  Created by Etienne Sabatier on 23/06/2015.
//  Copyright (c) 2015 TakeItEasy. All rights reserved.
//

import Foundation

import UIKit

class AskNumberViewController: UIViewController, MyLabelDelegate {
    
    @IBOutlet weak var numberEntryField: UITextField!
    var myNumber : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        numberEntryField.becomeFirstResponder()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextBtnPushed(sender: AnyObject) {
        myNumber = numberEntryField.text
        var myLabel = MyClassHandlingDelegate()
        myLabel.delegate = self
        myLabel.text = myLabel.myName()
        self.view.addSubview(myLabel)
        
    }
}

