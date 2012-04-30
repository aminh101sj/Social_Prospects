//
//  ViewController.m
//  Social_ProspectsV2
//
//  Created by Minh Nguyen on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EventViewController.h"
#import "ViewController.h"
#import "UIExpandableTableView.h"
#import "GHCollapsingAndSpinningTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize eventList;
@synthesize tableView;
//@synthesize index;

/*
- (void)loadView {
    self.tableView = [[UIExpandableTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
}

#pragma mark - Table view expandable view

- (BOOL)tableView:(UIExpandableTableView *)tableView canExpandSection:(NSInteger)section {
    // return YES, if the section should be expandable
    return section == YES;
}

- (BOOL)tableView:(UIExpandableTableView *)tableView needsToDownloadDataForExpandableSection:(NSInteger)section {
    // return YES, if you need to download data to expand this section. tableView will call tableView:downloadDataForExpandableSection: for this section
    return !_didDownloadData;;
}

- (UITableViewCell<UIExpandingTableViewCell> *)tableView:(UIExpandableTableView *)tableView expandingCellForSection:(NSInteger)section {
    // this cell will be displayed at IndexPath with section: section and row 0
    NSString *CellIdientifier = @"GHCollapsingAndSpinningTableViewCell";
    
    GHCollapsingAndSpinningTableViewCell *cell = (GHCollapsingAndSpinningTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdientifier];
    
    if (cell == nil) {
        cell = [[GHCollapsingAndSpinningTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdientifier];
    }
    
    //He hardcoded it to be one...
    cell.textLabel.text = @"Expand this section";
    
    
    return cell;
}
 
 - (void)tableView:(UIExpandableTableView *)tableView downloadDataForExpandableSection:(NSInteger)section {
 // download your data here
 // call [tableView expandSection:section animated:YES]; if download was successful
 // call [tableView cancelDownloadInSection:section]; if your download was NOT successful
 // download your data here
 double delayInSeconds = 2.0;
 dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
 dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
 // save your state, that you did download the data
 _didDownloadData = YES;
 // call [tableView cancelDownloadInSection:section]; if your download failed
 _dataArray = [list copy];
 
 // and expand this section after download completed
 [tableView expandSection:section animated:YES];
 } 
 
 */

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.eventList = [[NSArray alloc] initWithObjects: @"Philz", @"Smoke Eaters", @"Peanuts", nil];
    self.title = @"Events";
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.eventList = nil;
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (NSInteger)numberOfSectionsInTableView:
(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)
tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.eventList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
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
    NSIndexPath *index = [self.tableView indexPathForSelectedRow];
    EventViewController *evc = (EventViewController *)[segue destinationViewController];
    evc.titleText = [eventList objectAtIndex:(index.row)];
    [self.tableView deselectRowAtIndexPath:index animated:YES]; 

    //NSLog(@"DIFFERENT %d", self.index);
    if(evc.titleText == @"Philz") {
        evc.imageURL = @"http://s3-media3.ak.yelpcdn.com/bphoto/HX0S_4Rb0VuhluHrEXGbUw/ms.jpg";
        evc.bioText = @"Philz is where to go for real coffee.  I'm a latte kinda girl that finds amusement in seeing what kind of design the barista can do with froth.";
        evc.eventList = [[NSArray alloc] initWithObjects: @"Hip Music", @"Hip Dances", @"Hip Central", nil];
    }
    else if(evc.titleText == @"Peanuts") {
        evc.imageURL = @"http://s3-media1.ak.yelpcdn.com/bphoto/2797QkRrZ4kUvKAeE_dJwQ/ms.jpg";
        evc.bioText = @"Overall, Peanuts is a SJSU mainstay for great reason.";
        evc.eventList = [[NSArray alloc] initWithObjects: @"Drunken Kung Fu", @"Drunken Master", @"Drunk Period", nil];
    }
    else if(evc.titleText == @"Smoke Eaters") {
        evc.imageURL = @"http://s3-media1.ak.yelpcdn.com/bphoto/1-lHpG20Olbh_oIicvkQPw/ms.jpg";
        evc.bioText = @"Love the chicken tenders here. I used to come here sometimes when I was an undergrad at San Jose State.";
        evc.eventList = [[NSArray alloc] initWithObjects: @"Hot Wings", @"Hot Fries", @"Hot Chicks en", nil];
    }

}

@end
