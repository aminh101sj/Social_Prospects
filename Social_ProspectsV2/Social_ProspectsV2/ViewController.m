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
#import "Location.h"
#import "Event.h"
#import "Comment.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize eventList, eventLocations;
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
        Location *col = [self.eventLocations objectAtIndex: section];
        _dataArray = [col.events copy];
        
        // and expand this section after download completed
        [tableView expandSection:section animated:YES];
    });
}

#pragma mark - Regular provided template code
 
- (void)viewDidLoad
{
    [super viewDidLoad];
   
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://gre.gd/json.php"]];
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSError *parseError = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingAllowFragments error:&parseError];
    //    NSLog(@"Response: %@", [jsonObject objectForKey:@"places"]);
    
    NSArray *places = [jsonObject objectForKey:@"places"];
    NSLog(@"PLACES: %@", places);
    NSMutableArray *names = [[NSMutableArray alloc] initWithCapacity:[places count]];
    NSMutableArray *locations = [[NSMutableArray alloc] initWithCapacity:[places count]];
    Location *loc;
    Event *ev;
    NSArray *events;
    NSArray *coms;
    Comment *com;
    
    
    //populate the locaiton array
    for (NSDictionary * dict in places){
        loc = [[Location alloc] init];
        loc.name = [dict objectForKey:@"name"];
        loc.desc = [dict objectForKey:@"description"];
        loc.img = [dict objectForKey:@"image"];
        
        NSString *name = [dict objectForKey:@"name"];
       // NSLog(@"Location:%@ Event:%@", name,[dict objectForKey:@"events"]);
        events = [dict objectForKey:@"events"];
        NSMutableArray *evA = [[NSMutableArray alloc] initWithCapacity:[events count]];
       // NSLog(@"THIS IS HOW WE DO IT: %ld", (long)[events count]);
        for (NSDictionary *d in events) {            
            
            ev = [[Event alloc] init];
           // NSLog(@"ADDING %@", [d objectForKey:@"name"]);
            ev.name = [d objectForKey:@"name"];
            ev.desc = [d objectForKey:@"description"];
            ev.rating = [d objectForKey:@"rating"];
            
            coms = [d objectForKey:@"comments"];
            NSMutableArray *comA = [[NSMutableArray alloc] initWithCapacity:[coms count]];
            
            for (NSDictionary *a in coms) {
                com = [[Comment alloc] init];
                com.name = [a objectForKey:@"name"];
                com.comment = [a objectForKey:@"comment"];
                [comA addObject:com];
                //NSLog(@"NUMBER OF COMMENTS: %ld", (long)[comA count]);
            }
            ev.comments = comA;
            //NSLog(@"EVA: %@", comA);
            [evA addObject:ev];
         //   NSLog(@"IN ADDING EVENTS: %ld", (long)[evA count]);
        }
       // NSLog(@"EVENTS: %ld", (long)[evA count]);
        loc.events = evA;
       //  NSLog(@"AGAIN EVENTS: %ld", (long)[loc.events count]);
        [locations addObject:loc];
        [names addObject:name];
    }
    NSLog(@"greg: %@", names);
    self.eventList = names;
    self.eventLocations = locations;
    //NSLog(@"MINH Number of Sections: %ld", (long) [self.eventLocations count]);
    //Location *me = [self.eventLocations objectAtIndex:1];
    //Event *me2 = [me.events objectAtIndex:0];
    //NSLog(@"%ld", [me.events count]);
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
    return [self.eventLocations count];
}

- (NSInteger)tableView:(UITableView *)
tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    //[self.eventLocations objectAtIndex: section];
    Location *col = [self.eventLocations objectAtIndex:section];
    return [col.events count]+1;
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
    
    Event *ev = [_dataArray objectAtIndex:indexPath.row-1];
    cell.textLabel.text = ev.name;
    
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
    evc.titleText = [eventList objectAtIndex:(index.row-1)];
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
