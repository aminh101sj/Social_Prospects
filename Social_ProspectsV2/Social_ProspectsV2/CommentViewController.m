//
//  CommentViewController.m
//  Social_ProspectsV2
//
//  Created by Greg Mathews on 5/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CommentViewController.h"

@interface CommentViewController ()

@end

@implementation CommentViewController
@synthesize commentText;
@synthesize commenterName;
@synthesize imageUrl;
@synthesize commentData;
@synthesize nameData;
@synthesize imageData;

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
    NSData *mydata = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:imageData]];
    imageUrl.image = [[UIImage alloc] initWithData:mydata];
    commentText.text = commentData;
    commenterName.text = nameData;
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

@end
