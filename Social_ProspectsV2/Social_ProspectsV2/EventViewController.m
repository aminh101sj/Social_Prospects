//
//  EventViewController.m
//  Social_ProspectsV2
//
//  Created by Minh Nguyen on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EventViewController.h"
#import "LocationViewController.h"

@interface EventViewController ()

@end

@implementation EventViewController
@synthesize bio;
@synthesize titleText;
@synthesize image;
@synthesize bioText;
@synthesize imageURL;
@synthesize eventList;
@synthesize tableView;

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
    self.bio.text = bioText;
    self.title = titleText;
    [super viewDidLoad];
    NSData *mydata = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:imageURL]];
    image.image = [[UIImage alloc] initWithData:mydata];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    self.bio = nil;
    self.image = nil;
    self.bioText = nil;
    self.titleText = nil;
    self.imageURL = nil;
    self.eventList = nil;
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
    static NSString *CellIdentifier = @"Cell2";
    
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSString *identifier;
    identifier = segue.identifier;
    if([identifier isEqualToString:@"LocationSegue"]){
    NSIndexPath *index = [self.tableView indexPathForSelectedRow];
    LocationViewController *evc = (LocationViewController *)[segue destinationViewController];
    evc.data = [eventList objectAtIndex:(index.row)];
    [self.tableView deselectRowAtIndexPath:index animated:YES]; 
    }
    
}

@end
