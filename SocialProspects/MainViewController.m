//
//  MainViewController.m
//  SocialProspects
//
//  Created by Alben Cheung on 4/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

//@synthesize list;
@synthesize keyToObject;
@synthesize titleToKey;
@synthesize keyToTitle;
@synthesize placesData;
@synthesize placesList;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    /*self.list = [[NSArray alloc] 
                 initWithObjects:@"Philz Coffee", 
                 @"Smoke Eaters", nil];*/
    self.title = @"Social Prospects";
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"HotList" ofType:@"plist"];
	placesData = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    NSLog(@"%@",path);
    NSLog(@"%@",placesData);
    keyToTitle = [[NSMutableDictionary alloc] init];
	keyToObject = [[NSMutableDictionary alloc] init];
	titleToKey = [[NSMutableDictionary alloc] init];
    
    
    int count = 0;
	for (NSDictionary *place in placesData) {
		count++;
        NSString *name = [NSString stringWithString:[place objectForKey:@"name"]];
		NSString *key = [NSString stringWithString:[place objectForKey:@"key"]];
        NSLog(@"%@",name);
        NSLog(@"%@",key);
        [titleToKey setObject:key forKey:name];
		[keyToTitle setObject:name forKey:key];
        [keyToObject setObject:@"" forKey:key];
	}
    
	for (NSArray *place in placesData) 
	{
		NSString *key = [place objectAtIndex:0];
		if ([keyToObject objectForKey:key] == nil) continue;
		if ([place count] <= 1) continue;
		
		NSMutableArray *newPlace = [[NSMutableArray alloc] initWithArray:place];
		[newPlace removeObjectAtIndex:0];
		[keyToObject setObject:newPlace forKey:key];
        
	}
    
    placesList = [[NSMutableArray alloc] initWithArray:[titleToKey allKeys]];
    
    NSLog(@"%@",placesList);
    //placesList = [[NSMutableArray alloc] initWithArray:[titleToKey allKeys]];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    //self.list = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:
(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

/*- (NSInteger)tableView:(UITableView *)
tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    //return [self.list count];
}*/

/*- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView 
                             dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] 
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    // Configure the cell.
    cell.textLabel.text = 
    [self.list objectAtIndex: 
     [indexPath row]];
    return cell;
}*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [placesList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}
	cell.textLabel.text = [placesList objectAtIndex:indexPath.row];
	return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}


@end
