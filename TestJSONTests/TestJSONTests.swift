//
//  TestJSONTests.swift
//  TestJSONTests
//
//  Created by Steven Poon on 9/12/2015.
//  Copyright © 2015 Steven Poon. All rights reserved.
//

import Foundation
import UIKit
import XCTest
@testable import Test

class TestJSONTests: XCTestCase {
    
    var myDictOfDict:NSDictionary = [
        "a" : ["fname": "abc", "lname": "def"],
        "b" : ["fname": "ghi", "lname": "jkl"]
    ]
    
    var changestring = "{\n  \"a\" : {\n    \"lname\" : \"def\",\n    \"fname\" : \"abc\"\n  },\n  \"b\" : {\n    \"lname\" : \"jkl\",\n    \"fname\" : \"ghi\"\n  }\n}"


    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNSDictionarytoNSString(){
        
        var data = NSData()
        do{
            //data = try NSJSONSerialization.dataWithJSONObject(myDictOfDict, options: .PrettyPrinted)
            data = try NSJSONSerialization.dataWithJSONObject(myDictOfDict, options: [])
        }
        catch{
        }
        NSLog("this is data \(data)")
        
        let newstring = NSString(data: data, encoding: NSUTF8StringEncoding) as! String
        
        assert(newstring == changestring)
        
    }
    
    func testNSStringtoNSDictionary(){
        
        let data = changestring.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        var dict = NSDictionary()
        do{
            //dict = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSDictionary
            dict = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! NSDictionary
        }
        catch{
        }
    
        NSLog("this is dict \(dict)")
        
        assert(dict == myDictOfDict)
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
