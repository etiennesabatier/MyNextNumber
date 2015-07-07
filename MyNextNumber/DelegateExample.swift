//
//  DelegateExample.swift
//  MyNextNumber
//
//  Created by Etienne Sabatier on 06/07/2015.
//  Copyright (c) 2015 TakeItEasy. All rights reserved.
//

import Foundation

class MyNewClass {
    var delegate: SomeProtocol
    
    init(delegate: SomeProtocol) {
        self.delegate = delegate
    }
    
    func getData(a: String){
        
        delegate.varString = "My Number is \(a)"
        println(delegate.varString!)
    }
    
}

protocol SomeProtocol {
    var varInt: Int? {get}
    var varString: String? {get set}
    func randomFunc(a: Int) -> Int
}

