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
@synthesize name, desc, image, tableView;
@synthesize descText;
@synthesize titleText;
@synthesize imageURL, eventList;

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
    self.name.text = self.titleText;
    self.desc.text = self.descText;
    self.title = self.titleText;
    NSData *mydata = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:imageURL]];
    image.image = [[UIImage alloc] initWithData:mydata];
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
    [app openURL:[NSURL URLWithString:@"http://maps.google.com/maps?q='San Jose State University'"]];
}

@end
