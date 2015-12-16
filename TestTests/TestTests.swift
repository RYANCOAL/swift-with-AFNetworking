//
//  TestTests.swift
//  TestTests
//
//  Created by Steven Poon on 25/11/2015.
//  Copyright © 2015 Steven Poon. All rights reserved.
//

import XCTest
import UIKit
@testable import Test



class TestTests: XCTestCase {
    
    var Manager = AFHTTPSessionManager()
    var urlPrefix = NSURL(string:"http://httpbin.org")
    
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        Manager = AFHTTPSessionManager(baseURL: urlPrefix)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testSimpleGet(){
        let expect = expectationWithDescription("Test expectations")
        Manager.responseSerializer = AFHTTPResponseSerializer()
        let task = Manager.GET("/",
                parameters: nil,
                success: {(task:NSURLSessionDataTask, id responseObject) -> Void in
                    let responseData = responseObject
                    let response = NSString.init(data: responseData as! NSData, encoding: NSUTF8StringEncoding)
                    XCTAssertNotNil(response)
                    expect.fulfill()
                }
                ,
                failure: {(task:NSURLSessionDataTask?, error:NSError) -> Void in
                    print("\(error.localizedDescription)")
                    XCTAssertNil(error)
                }
        )
        task?.resume();
        waitForExpectationsWithTimeout(5.0) { error in
            print("Timed out with error:\(error)");
        }

        
    }
    
    func testSimpleGetJson(){
        let expect = expectationWithDescription("Test expectations")
        Manager.responseSerializer = AFJSONResponseSerializer()
        Manager.GET("/get",
            parameters: nil,
            success: {(task:NSURLSessionDataTask, NSDictionary response) -> Void in
                XCTAssertNotNil(response)
                XCTAssert((response.objectForKey("url") as! String)=="http://httpbin.org/get")
                expect.fulfill()
            }
            ,
            failure: {(task:NSURLSessionDataTask?, error:NSError) -> Void in
                print("\(error.localizedDescription)")
                XCTAssertNil(error)
            }
        )
        waitForExpectationsWithTimeout(5.0) { error in
            print("Timed out with error:\(error)");
        }

        
    }
    
    func testRequestTimeout(){
        let expect = expectationWithDescription("Test expectations")
        GetresponseSerializer()
        Manager.requestSerializer.timeoutInterval = 5
        Manager.GET("/delay/10",
            parameters: nil,
            success: {(task:NSURLSessionDataTask, NSDictionary response) -> Void in
                XCTAssertNil(response)
            }
            ,
            failure: {(task:NSURLSessionDataTask?, error:NSError) -> Void in
                print("\(error.localizedDescription)")
                XCTAssertNotNil(error)
                expect.fulfill()
            }
        )
        waitForExpectationsWithTimeout(10.0) { error in
            print("Timed out with error:\(error)");
        }


    }
    
    func testSlowCall(){
        let expect = expectationWithDescription("Test expectations")
        GetresponseSerializer()
        Manager.requestSerializer.timeoutInterval = 10
        Manager.GET("/delay/5",
            parameters: nil,
            success: {(task:NSURLSessionDataTask, NSDictionary response) -> Void in
                XCTAssertNotNil(response)
                expect.fulfill()
            }
            ,
            failure: {(task:NSURLSessionDataTask?, error:NSError) -> Void in
                print("\(error.localizedDescription)")
                XCTAssertNil(error)
               
            }
        )
        waitForExpectationsWithTimeout(10.0) { error in
            print("Timed out with error:\(error)");
        }


    }
    
    func testCancelCall(){
        let expect = expectationWithDescription("Test expectations")
        GetingresponseSerializer()
        Manager.requestSerializer.timeoutInterval = 10
        let task = Manager.GET("/delay/5",
            parameters: nil,
            success: {(task:NSURLSessionDataTask, NSDictionary response) -> Void in
                XCTAssertNil(response)
                
            }
            ,
            failure: {(task:NSURLSessionDataTask?, error:NSError) -> Void in
                print("\(error.localizedDescription)")
                XCTAssertNotNil(error)
                
            }
        )
        
        task?.resume()
        task?.cancel()
        
        XCTAssertEqual(task?.state, NSURLSessionTaskState.Canceling)
        XCTAssertNotEqual(task?.state, NSURLSessionTaskState.Completed)
        expect.fulfill()
        waitForExpectationsWithTimeout(10.0) { error in
            print("Timed out with error:\(error)");
        }

    
    }
    
    func testEnsureAsyness(){
        let expect = expectationWithDescription("Test expectations")
        let results = NSMutableArray(capacity: 2)
        GetresponseSerializer()
        Manager.requestSerializer.timeoutInterval = 10
        Manager.GET("/delay/5",
            parameters: nil,
            success: {(task:NSURLSessionDataTask, NSDictionary response) -> Void in
                XCTAssertNotNil(response)
                results.addObject(2);
                expect.fulfill();
            }
            ,
            failure: {(task:NSURLSessionDataTask?, error:NSError) -> Void in
                print("\(error.localizedDescription)")
                XCTAssertNil(error)
            }
        )
        
        results.addObject(1)
        waitForExpectationsWithTimeout(10.0) { error in
            print("Timed out with error:\(error)");
        }

        XCTAssert(results[0] as! NSObject == 1)
        XCTAssert(results[1] as! NSObject == 2)
        
    }
    
    func testPostForm(){
        let expect = expectationWithDescription("Test expectations")
        GetingresponseSerializer()
        let dict = NSDictionary(object: "bar", forKey: "foo")
        NSLog("this is \(dict)")
    
        let task = Manager.POST("/post",
            parameters:dict,
            success: {(task:NSURLSessionDataTask, NSDictionary response) -> Void in
                XCTAssertNotNil(response)
                XCTAssertNotNil(response.objectForKey("form"))
                NSLog("this is\(response)")
                let formData = response.objectForKey("form") as! NSDictionary
                NSLog("this is\(formData)")
                XCTAssert(formData.objectForKey("foo") as! String == "bar")
                let headers = response.objectForKey("headers") as! NSDictionary
                XCTAssert((headers.objectForKey("Content-Type") as! String) == "application/x-www-form-urlencoded")
                expect.fulfill();
            }
            ,
            failure: {(task:NSURLSessionDataTask?, error:NSError) -> Void in
                print("\(error.localizedDescription)")
                XCTAssertNil(error)
            }
            
        )
        
        task?.resume()
        waitForExpectationsWithTimeout(10.0) { error in
            print("Timed out with error:\(error)");
        }

    
    }

    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
   

    
}

extension TestTests{
    
    func GetresponseSerializer(){
        Manager.responseSerializer = AFJSONResponseSerializer()
        Manager.requestSerializer = AFJSONRequestSerializer()
        
    }
    
    func GetingresponseSerializer(){
        Manager.responseSerializer = AFJSONResponseSerializer()
        Manager.requestSerializer  = AFHTTPRequestSerializer()
    }
}
