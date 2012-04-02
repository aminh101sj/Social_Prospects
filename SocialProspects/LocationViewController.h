//
//  LocationViewController.h
//  SocialProspects
//
//  Created by Alben Cheung on 4/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationViewController : UIViewController{
	IBOutlet UITableView *_tableView;
	NSDictionary *data;
    NSMutableArray *places;
	NSMutableArray *displayStrings;
	NSString *phoneNum;
}

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSDictionary *data;
@property (nonatomic, retain) NSMutableArray *places;

@end
