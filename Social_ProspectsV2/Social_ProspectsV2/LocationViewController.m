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
@synthesize events;


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
    NSLog(@"%@", self.eventList);
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

- (NSInteger) tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section  {
    return [self.eventList count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [self.tableView 
                             dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] 
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    // Configure the cell.
    cell.textLabel.text = [self.eventList objectAtIndex: [indexPath row]];
    //cell.textLabel.text = @"Amazing";
    return cell;
}

-(IBAction)mapIt:(id)sender{
    UIApplication *app = [UIApplication sharedApplication];
    [app openURL:[NSURL URLWithString:@"http://maps.google.com/maps?q='SJSU'"]];
   //[app openURL:[NSURL URLWithString:@"http://maps.google.com/maps?q='San Jose State University'"]];
}

@end
