//
//  ViewController.h
//  JSONParser
//
//  Created by Alex Rodrigues on 2/28/14.
//  Copyright (c) 2014 AppleDev. All rights reserved.
//

// ========================   www.appledev.com.br  CREATING GREAT APPS FOR MOBILE ===========================
// ========================   www.appledev.com.br  CREATING GREAT APPS FOR MOBILE ===========================
// ========================   www.appledev.com.br  CREATING GREAT APPS FOR MOBILE ===========================



#import <UIKit/UIKit.h>
#import "JSONParser.h"

@interface ViewController : UIViewController <JSONParserDelegate>
{
    IBOutlet UITextView *txtView;
    IBOutlet UITextField *txtUrl;
}

// method called to parse JSON File
- (IBAction)parseNOWJSONFile:(UIButton *)sender;

// method called to parse JSON URL
- (IBAction)parseJSONURL:(UIButton *)sender;



// ========================   www.appledev.com.br  CREATING GREAT APPS FOR MOBILE ===========================// ========================   www.appledev.com.br  CREATING GREAT APPS FOR MOBILE ===========================// ========================   www.appledev.com.br  CREATING GREAT APPS FOR MOBILE ===========================
@end
