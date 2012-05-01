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
//@synthesize tableView;
//@synthesize index;

- (void)loadView {
    self.tableView = [[UIExpandableTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
}

#pragma mark - Table view expandable view

- (BOOL)tableView:(UIExpandableTableView *)tableView canExpandSection:(NSInteger)section {
    // return YES, if the section should be expandable
    return YES;
}

- (BOOL)tableView:(UIExpandableTableView *)tableView needsToDownloadDataForExpandableSection:(NSInteger)section {
    // return YES, if you need to download data to expand this section. tableView will call tableView:downloadDataForExpandableSection: for this section
    return !_didDownloadData;
}

- (UITableViewCell<UIExpandingTableViewCell> *)tableView:(UIExpandableTableView *)tableView expandingCellForSection:(NSInteger)section {
 
    // this cell will be displayed at IndexPath with section: section and row 0
    NSString *CellIdientifier = @"GHCollapsingAndSpinningTableViewCell";
    
    GHCollapsingAndSpinningTableViewCell *cell = (GHCollapsingAndSpinningTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdientifier];
    
    if (cell == nil) {
        cell = [[GHCollapsingAndSpinningTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdientifier];
    }
    
    //He hardcoded it to be one...
    cell.textLabel.text = [self.eventList objectAtIndex: section];
    
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
        
        // and expand this section after download completed
        [tableView expandSection:section animated:YES];
    });
}
 
- (void)viewDidLoad
{
    [super viewDidLoad];
   
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://gre.gd/json.php"]];
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSError *parseError = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:&parseError];
    //    NSLog(@"Response: %@", [jsonObject objectForKey:@"places"]);
    
    NSArray *places = [jsonObject objectForKey:@"places"];
    NSMutableArray *names = [[NSMutableArray alloc] initWithCapacity:[places count]];
    
    for (NSDictionary * dict in places){
        NSString *name = [dict objectForKey:@"name"];
        [names addObject:name];
    }
    NSLog(@"greg: %@", names);
    self.eventList = names;
    self.title = @"Events";
	// Do any additional setup after loading the view, typically from a nib.
    
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
    return [self.eventList count];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self performSegueWithIdentifier:@"EventSegue" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSIndexPath *index = [self.tableView indexPathForSelectedRow];
    EventViewController *evc = (EventViewController *)[segue destinationViewController];
    evc.titleText = [eventList objectAtIndex:(index.row)];
    [self.tableView deselectRowAtIndexPath:index animated:YES]; 
    
    // Do any additional setup after loading the view, typically from a nib.
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://gre.gd/json.php?name=%@", evc.titleText]]];
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSError *parseError = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:&parseError];
//    NSLog(@"%@", jsonObject);
    evc.bioText = [jsonObject objectForKey:@"description"];
    evc.imageURL = [jsonObject objectForKey:@"image"];
    
    NSArray *events = [jsonObject objectForKey:@"events"];
    NSMutableArray *eventNames = [[NSMutableArray alloc] initWithCapacity:[events count]];
    for (NSDictionary * dict in events){
        NSString *eventName = [dict objectForKey:@"name"];
        [eventNames addObject:eventName];
    }
    evc.eventList = eventNames;
    
}

@end
