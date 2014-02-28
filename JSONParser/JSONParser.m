//
//  JSONParser.m
//  JSONParser
//
//  Created by Alex Rodrigues on 2/28/14.
//  Copyright (c) 2014 AppleDev. All rights reserved.
//

// ========================   www.appledev.com.br  CREATING GREAT APPS FOR MOBILE ===========================// ========================   www.appledev.com.br  CREATING GREAT APPS FOR MOBILE ===========================// ========================   www.appledev.com.br  CREATING GREAT APPS FOR MOBILE ===========================// ========================   www.appledev.com.br  CREATING GREAT APPS FOR MOBILE ===========================

#import "JSONParser.h"

@implementation JSONParser
@synthesize delegate;

- (id)initWithURL:(NSString *)url
{
    if (self != NULL) {
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
        dispatch_async(queue, ^{
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
            if (data != NULL) {
                [self parsingData:data];
            }else
            {
                [delegate parserDidFailed];
            }
        });
    }
    
    return self;
}

- (id)initWithContentsOfFile:(NSString *)path
{
    if (self != NULL) {
        //handling with memory
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
        dispatch_async(queue, ^{
            NSData *data = [NSData dataWithContentsOfFile:path];
            if (data != NULL) {
                [self parsingData:data];
            }else
            {
                [delegate parserDidFailed];
            }
            
        });
    }
    
    return self;
}

// receiving the NSData to do the parse
- (void)parsingData:(NSData *)data
{
    id someDataFromJSOn = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    if (someDataFromJSOn == NULL) {
        [delegate parserDidFailed];
    }
    //sending the data to view controller
    dispatch_async(dispatch_get_main_queue(), ^{
        [delegate parserDidFinishedWithResults:someDataFromJSOn];
    });
}
// ========================   www.appledev.com.br  CREATING GREAT APPS FOR MOBILE ===========================// ========================   www.appledev.com.br  CREATING GREAT APPS FOR MOBILE ===========================// ========================   www.appledev.com.br  CREATING GREAT APPS FOR MOBILE ===========================// ========================   www.appledev.com.br  CREATING GREAT APPS FOR MOBILE ===========================// ========================   www.appledev.com.br  CREATING GREAT APPS FOR MOBILE ===========================
@end
