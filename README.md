{\rtf1\ansi\ansicpg1252\cocoartf1404\cocoasubrtf130
{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;\f1\fnil\fcharset0 Monaco;}
{\colortbl;\red255\green255\blue255;\red38\green38\blue38;\red38\green38\blue38;\red100\green56\blue32;
\red196\green26\blue22;\red0\green0\blue0;\red170\green13\blue145;\red63\green110\blue116;\red83\green83\blue83;
}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\sl320\partightenfactor0

\f0\fs28 \cf2 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 # <<Swift-with-AFNetworking >>\
this is swift with AFNetworking,\
First, Please install CocoaPods, follow this website\
\pard\pardeftab720\sl320\partightenfactor0
{\field{\*\fldinst{HYPERLINK "http://code4app.com/article/cocoapods-install-usage"}}{\fldrslt \cf2 http://code4app.com/article/cocoapods-install-usage}}\
and stop on finish the Podfile.\
\
Don\'92t close the website,\
Open the Xcode and new Xcode project, choose Single View Application for the first test,give the Product Name,\
choose language in swift, if you want to XCTest, please take the\
Include Unit Tests. Finish it.\
Please new file like your Product name with bridging-Header.h, such as this, Test-bridging-Header.h\
\
In Build Settings, search swift Compiler, after install Objective-C Compatibility Header is YES.The Objective-C Bridging Header is your_project/******-\cf3 \outl0\strokewidth0 bridging-Header.h, such as this, \cf2 \outl0\strokewidth0 \strokec2 \
Test/Test-bridging-Header.h,\
\pard\pardeftab720\sl320\partightenfactor0
\cf3 \outl0\strokewidth0 Finish it, after try to build the app to ensure that there is no   error in this.\
\
\cf2 \outl0\strokewidth0 \strokec2 Please go ahead with website with pod install, after that open the Xcode, choose *****.xcworkspace,such as Test.xcworkspace it will have two project, first is your project name, second is Pods. in \cf3 \outl0\strokewidth0 ******-bridging-Header.h, input \cf4 \kerning1\expnd0\expndtw0 \CocoaLigature0 #import \cf5 "AFNetworking.h\'94. \cf6 after try this code is \cf7 var\cf0  Manager = \cf8 AFHTTPSessionManager\cf0 () \
if no error,please build the app for testing.
\f1\fs22 \cf9 \expnd0\expndtw0\kerning0
\CocoaLigature1 \outl0\strokewidth0 \strokec9 \

\f0\fs28 \cf2 \strokec2 \
\pard\pardeftab720\sl320\partightenfactor0
\cf2 \
\
\
}