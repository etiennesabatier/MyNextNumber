//
//  DelegateExampleView.swift
//  MyNextNumber
//
//  Created by Etienne Sabatier on 06/07/2015.
//  Copyright (c) 2015 TakeItEasy. All rights reserved.
//

import Foundation
import UIKit

class MyClassHandlingDelegate : UILabel, SomeProtocol {
    
    //Conformity to SomeProtocol
    var varInt: Int?
    var varString: String?
    var myNewClass : MyNewClass?
    var delegate : MyLabelDelegate?
    func randomFunc(a: Int) -> Int {
        return 23*a
    }
    
    init(){
        var aRect = CGRectMake(150, 400, 174, 21)
        super.init(frame : aRect)
        self.font = UIFont.systemFontOfSize(15)
        self.textColor = UIColor.blackColor()
        myNewClass = MyNewClass(delegate: self)
    }
    
    //Use of delegation :
    
    func myName() -> String {
           // myNewClass!.getData(self.delegate?.myNumber!!)
            return "Bonjour numéro \(self.delegate!.myNumber!)"
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

protocol MyLabelDelegate {
    var myNumber : String? {get set}
}