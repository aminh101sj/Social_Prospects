//
//  AddViewController.m
//  Social_ProspectsV2
//
//  Created by Alben Cheung on 5/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController
@synthesize username;
@synthesize userComment;
@synthesize commentBox;
@synthesize userBox;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)submitComment:(id)sender{
    username = userBox.text;
    userComment = commentBox.text;
    NSString *requestURL = [NSString stringWithFormat:@"http://gre.gd/comment.php?name=%@&comment=%@", username, userComment];
    NSLog(@"%@", requestURL);
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:requestURL]];
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
}

@end
