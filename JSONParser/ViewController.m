//
//  ViewController.m
//  JSONParser
//
//  Created by Alex Rodrigues on 2/28/14.
//  Copyright (c) 2014 AppleDev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// method called to parse JSON File
- (IBAction)parseNOWJSONFile:(UIButton *)sender
{
    JSONParser *parser = [[JSONParser alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"LocalFile" ofType:@"json"]];
    parser.delegate = self;
}

// method called to parse JSON URL
- (IBAction)parseJSONURL:(UIButton *)sender
{
    if (txtUrl.text.length == 0) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"OOOPS" message:@"Please insert a VALID URL :)" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }else
    {
        JSONParser *parser = [[JSONParser alloc]initWithURL:txtUrl.text];
        parser.delegate = self;
    }

}

// when parse finished the class call this method to return the result of json
- (void)parserDidFinishedWithResults:(id)results
{
    // transforming the result to NSDictionary or NSArray
    if ([results isKindOfClass:[NSArray class]]) {
        NSArray *arrayJSON = (NSArray *)results;
        txtView.text = [arrayJSON description];
        
    }else if ([results isKindOfClass:[NSDictionary class]]){
        NSDictionary *dictJSON = (NSDictionary *)results;
        txtView.text = [dictJSON description];
    }
}

// in case the parse fail
- (void)parserDidFailed
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"OOOPS" message:@"We could not parse your json :(" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

@end
