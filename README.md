# <<Swift-with-AFNetworking >>

this is swift with AFNetworking,
First, Please install CocoaPods, follow this website
http://code4app.com/article/cocoapods-install-usage
and stop on finish the Podfile.

Don’t close the website,
Open the Xcode and new Xcode project, choose Single View Application for the first test,give the Product Name,
choose language in swift, if you want to XCTest, please take the
Include Unit Tests. Finish it.
Please new file like your Product name with bridging-Header.h, such as this, Test-bridging-Header.h

In Build Settings, search swift Compiler, after install Objective-C Compatibility Header is YES.The Objective-C Bridging Header is your_project/******-bridging-Header.h, such as this, 
Test/Test-bridging-Header.h,
Finish it, after try to build the app to ensure that there is no   error in this.

Please go ahead with website with pod install, after that open the Xcode, choose *****.xcworkspace,such as Test.xcworkspace it will have two project, first is your project name, second is Pods. in ******-bridging-Header.h, input #import "AFNetworking.h”. after try this code is var Manager = AFHTTPSessionManager() 
if no error,please build the app for testing.





