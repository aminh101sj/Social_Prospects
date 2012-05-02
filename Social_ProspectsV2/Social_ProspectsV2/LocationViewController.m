//
//  LocationViewController.m
//  Social_ProspectsV2
//
//  Created by Minh Nguyen on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LocationViewController.h"


@interface LocationViewController ()

@end

@implementation LocationViewController
@synthesize data;
@synthesize titleText;
@synthesize locAddress;
@synthesize imgUrl;
@synthesize locName;
@synthesize locDesc;
@synthesize locDescription;

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
    self.title = titleText;
    self.locName.text = titleText;
    self.locDesc.text = locDescription;
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

-(IBAction)mapIt:(id)sender{
    UIApplication *app = [UIApplication sharedApplication];
    
    [app openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://maps.google.com/maps?q='%@'",locAddress]]];
}

@end
