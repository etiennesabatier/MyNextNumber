//
//  SecondViewController.swift
//  MyNextNumber
//
//  Created by Etienne Sabatier on 23/06/2015.
//  Copyright (c) 2015 TakeItEasy. All rights reserved.
//

import Foundation

import UIKit

class AskNumberViewController: UIViewController, UITextFieldDelegate, MyLabelDelegate, APIDelegate {
    
    
    @IBOutlet weak var numberEntryField: UITextField!
    @IBOutlet weak var labelAnswer: NextNumberAnswerLabel!
    var myNumber : String?
    var api = APIController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.numberEntryField.becomeFirstResponder()
        self.numberEntryField.delegate = self
        labelAnswer.delegate = self
        labelAnswer.hidden = true
        self.api.delegate = self
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.numberEntryField.resignFirstResponder()
        return false
    }
    
    @IBAction func nextBtnPushed(sender: AnyObject) {
        
        var askedNumber = numberEntryField.text
        let request = self.api.buildrequest(askedNumber)
        self.api.sendRequest(request)
    }
    
    func updateLabel(result: String){
        self.myNumber = result
        labelAnswer.updateMyText()
        labelAnswer.hidden = false
    }
    
}

