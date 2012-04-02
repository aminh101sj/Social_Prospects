//
//  MainViewController.m
//  SocialProspects
//
//  Created by Alben Cheung on 4/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
#import "LocationViewController.h"

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
    
    self.title = @"Social Prospects";
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"HotList" ofType:@"plist"];
	placesData = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
    NSLog(@"%@",filePath);
    NSLog(@"%@",placesData);
    keyToTitle = [[NSMutableDictionary alloc] init];
	keyToObject = [[NSMutableDictionary alloc] init];
	titleToKey = [[NSMutableDictionary alloc] init];
    
    
    int count = 0;
	for (NSDictionary *place in placesData) {
		count++;
        NSString *aName =[NSString stringWithString:[place objectForKey:@"name"]];
		NSString *aKey = [NSString stringWithString:[place objectForKey:@"key"]];
        //NSLog(@"%@",aName);
        //NSLog(@"%@",aKey);
        [titleToKey setObject:aKey forKey:aName];
		[keyToTitle setObject:aName forKey:aKey];
        [keyToObject setObject:@"" forKey:aKey];
	}
    
    placesList = [[NSMutableArray alloc] initWithArray:[titleToKey allKeys]];
    
    //NSLog(@"%@",placesList);
    
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [placesList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellID = @"Cell";
	UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellID];
	
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
		
		cell.textLabel.text = [placesList objectAtIndex:indexPath.row];
	}
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	return cell;
}

/*- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}
	cell.textLabel.text = [placesList objectAtIndex:indexPath.row];
	return cell;
}*/

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
        
    NSString *titleString = [placesList objectAtIndex:indexPath.row];
    NSString *key = [titleToKey objectForKey:titleString];
    NSLog(@"%@",key);
        
    id object = [keyToObject objectForKey:key];
    if ([object isKindOfClass:[NSString class]]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil 
                                                        message:@"Hmm... We don't have data on this location."
                                                            delegate:self 
                                                                cancelButtonTitle:@"OK" 
                                                                    otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    LocationViewController *location = [[LocationViewController alloc] init];
    //location.data = ;
    location.places = [[NSMutableArray alloc] initWithArray:object];
    NSLog(@"%@",location.places);
    [self.navigationController pushViewController:location animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
        /*BuildingViewController *building = [[BuildingViewController alloc] init];
         building.departments = [[NSMutableArray alloc] initWithArray:object];
         [self.navigationController pushViewController:building animated:YES];
         [self.navigationController setNavigationBarHidden:NO];
         [building release];
         self.searchBar.text = nil;
         isSearching = YES;
         [tableView deselectRowAtIndexPath:indexPath animated:YES];*/
}


@end
