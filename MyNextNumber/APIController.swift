//
//  APIController.swift
//  MyNextNumber
//
//  Created by Etienne Sabatier on 07/07/2015.
//  Copyright (c) 2015 TakeItEasy. All rights reserved.
//

import Foundation
import UIKit

class APIController {
    
    let myAPI_URL = "https://mynextnumber.herokuapp.com/api"
    //let myAPI_URL = "http://localhost:3000/api"
    var delegate: APIDelegate?

    func buildrequest(myNumber: String)-> NSMutableURLRequest{
        
        //Variables that can be passed as paramters :
        var path = "askNextNumber?requested_number=\(myNumber)" //method in my API backend app
        var contentType = "application/json"
        
        //create URL
        let urlPath = "\(myAPI_URL)/\(path)"
        let requestURL = NSURL(string: urlPath)
        
        let request = NSMutableURLRequest(URL: requestURL!)
        
        //add request method
        request.HTTPMethod = "GET" //GET by defaut anyway
        
        //add request header
        request.addValue(contentType, forHTTPHeaderField: "Content-Type")
        
        //no authorization header at this time
        
        //set body content :(pas de body pour les request GET)
        //request.HTTPBody = "{\"requested_number\":\"\(myNumber)\"}".dataUsingEncoding(NSUTF8StringEncoding)
        
        return request
        
        
    }
    
    
    func sendRequest(request: NSURLRequest) {
        // Create a NSURLSession task
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            
            if(error != nil) {
                // If there is an error in the web request, print it to the console
                println(error.localizedDescription)
            }
            
            var err: NSError?
            
            if let jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as? NSDictionary {
                
            if(err != nil) {
            // If there is an error parsing JSON, print it to the console
            println("JSON Error \(err!.localizedDescription)")
            }
                
            if let result: NSString = jsonResult["follower"] as? NSString {
                //self.delegate.didReceiveAPIResults(results)
                
                    dispatch_async(dispatch_get_main_queue(), {
                        self.delegate!.updateLabel(result as String)
                        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                    })
                }
            }
          
    
        })
        
        // start the task
        
        task.resume()
    }
    
}

protocol APIDelegate {
    func updateLabel(result: String) -> Void
}
