//
//  TestHTTPTests.swift
//  TestHTTPTests
//
//  Created by Steven Poon on 10/12/2015.
//  Copyright © 2015 Steven Poon. All rights reserved.
//

import Foundation
import UIKit
import XCTest
@testable import Test

class TestHTTPTests: XCTestCase {
    
    var url = "http://httpbin.org"
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetJSON() {
    let urlget = NSURL(string:url+"/get")
    NSLog("this is urlget \(urlget)")
    let Data = NSData(contentsOfURL: urlget!)
    var jsonData = NSDictionary()
    do {
    jsonData = try NSJSONSerialization.JSONObjectWithData(Data!, options:NSJSONReadingOptions.MutableContainers ) as! NSDictionary
    }
    catch{
    }
    NSLog("this is getData\(jsonData)")

    }
    
    func testpostJSON(){
        let urlpost = NSURL(string: url+"/post")
        //NSLog("this is urlpost \(urlpost)")
        let myDictOfDict:NSDictionary = [
            "a" : 123,
            "b" : "4 5 6"
        ]
        var Data = NSData()
        do{
            Data = try NSJSONSerialization.dataWithJSONObject(myDictOfDict, options: .PrettyPrinted)
            
        }
        catch{
        }
        NSLog("this is postData \(Data)")

        let request = NSMutableURLRequest(URL: urlpost!)
       
        let jsonString = NSString(data: Data, encoding:NSUTF8StringEncoding)
        request.HTTPBody = jsonString?.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        request.HTTPMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        /*NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {(response,data,error)-> Void in})*///deprecated ios9.0
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: {(data,response,error)->Void in //using breaking point to show data

        })
        
        
        task.resume()
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
