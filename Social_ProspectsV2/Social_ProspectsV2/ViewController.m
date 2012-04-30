//
//  ViewController.m
//  Social_ProspectsV2
//
//  Created by Minh Nguyen on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EventViewController.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize eventList;
@synthesize tableView;
//@synthesize index;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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
    
//    //NSLog(@"DIFFERENT %d", self.index);
//    if(evc.titleText == @"Philz") {
//        evc.imageURL = @"http://s3-media3.ak.yelpcdn.com/bphoto/HX0S_4Rb0VuhluHrEXGbUw/ms.jpg";
//        evc.bioText = @"Philz is where to go for real coffee.  I'm a latte kinda girl that finds amusement in seeing what kind of design the barista can do with froth.";
//        evc.eventList = [[NSArray alloc] initWithObjects: @"Hip Music", @"Hip Dances", @"Hip Central", nil];
//    }
//    else if(evc.titleText == @"Peanuts") {
//        evc.imageURL = @"http://s3-media1.ak.yelpcdn.com/bphoto/2797QkRrZ4kUvKAeE_dJwQ/ms.jpg";
//        evc.bioText = @"Overall, Peanuts is a SJSU mainstay for great reason.";
//        evc.eventList = [[NSArray alloc] initWithObjects: @"Drunken Kung Fu", @"Drunken Master", @"Drunk Period", nil];
//    }
//    else if(evc.titleText == @"Smoke Eaters") {
//        evc.imageURL = @"http://s3-media1.ak.yelpcdn.com/bphoto/1-lHpG20Olbh_oIicvkQPw/ms.jpg";
//        evc.bioText = @"Love the chicken tenders here. I used to come here sometimes when I was an undergrad at San Jose State.";
//        evc.eventList = [[NSArray alloc] initWithObjects: @"Hot Wings", @"Hot Fries", @"Hot Chicks en", nil];
//    }

}

@end
