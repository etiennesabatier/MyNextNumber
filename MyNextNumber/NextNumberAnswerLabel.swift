//
//  DelegateExampleView.swift
//  MyNextNumber
//
//  Created by Etienne Sabatier on 06/07/2015.
//  Copyright (c) 2015 TakeItEasy. All rights reserved.
//

import Foundation
import UIKit

class NextNumberAnswerLabel : UILabel {
    
    var delegate : MyLabelDelegate?
    
    //Use of delegation :
    func updateMyText() {
        var nextNumber = self.delegate!.myNumber!
        self.text = "Your next number is \(nextNumber)"
    }
    
}

//Variables and methods declared in the protocol serve as information vehicule between class and delegate
protocol MyLabelDelegate {
    var myNumber : String? {get set}
    //the responsiblity of keeping track of the number is delegated to the AskNumberVC class
}