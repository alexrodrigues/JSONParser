//
//  JSONParser.h
//  JSONParser
//
//  Created by Alex Rodrigues on 2/28/14.
//  Copyright (c) 2014 AppleDev. All rights reserved.
//


// ========================   www.appledev.com.br  CREATING GREAT APPS FOR MOBILE ===========================


#import <Foundation/Foundation.h>

@protocol JSONParserDelegate <NSObject>

- (void)parserDidFinishedWithResults:(id)results;

- (void)parserDidFailed;

@end

@interface JSONParser : NSObject

@property(nonatomic, weak)id<JSONParserDelegate>delegate;

- (id)initWithURL:(NSString *)url;

- (id)initWithContentsOfFile:(NSString *)path;


// ========================   www.appledev.com.br  CREATING GREAT APPS FOR MOBILE ===========================

@end
