# <<Swift-with-AFNetworking >>

this is swift with AFNetworking,http://code4app.com/article/cocoapods-install-usage
First, Opening the website and follow step is needed.
After,stop it when finished the Podfile. 

Don’t close the website,open the Xcode and new Xcode project.
Choose Single View Application for the first test,give the Product Name,choose language in swift.
If you want to XCTest,take the Include Unit Tests.
The new file like your Product name with bridging-Header.h, such as this, Test-bridging-Header.h

In Build Settings, search swift Compiler, install Objective-C Compatibility Header is YES.
The Objective-C Bridging Header is your_project/******-bridging-Header.h, such as this, 
Test/Test-bridging-Header.h,try to build the app to ensure that there is no error in this.

Go ahead with website with pod install, after that open the Xcode, choose *****.xcworkspace,such as Test.xcworkspace it will have two project, first is your project name, second is Pods. in ******-bridging-Header.h, input #import "AFNetworking.h”. after try this code is var Manager = AFHTTPSessionManager() 
if no error,build the app for testing is best method to test no error in project.

if there are errors, please contact me, e-mail:lmf242003@gmail.com
