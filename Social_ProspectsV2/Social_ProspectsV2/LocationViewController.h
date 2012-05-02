//
//  LocationViewController.h
//  Social_ProspectsV2
//
//  Created by Minh Nguyen on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{

    IBOutlet UILabel *name;
    IBOutlet UILabel *desc;
    IBOutlet UIImageView *image;
    IBOutlet UITableView *tableView;
    NSString *descText;
    NSString *titleText;
    NSString *imageURL;
    NSArray *eventList;
    NSMutableArray *events;
}

-(IBAction)mapIt:(id)sender;


@property (nonatomic, retain) IBOutlet UILabel *name;
@property (nonatomic, retain) IBOutlet UILabel *desc;
@property (nonatomic, retain) IBOutlet UIImageView *image;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSString *descText;
@property (nonatomic, retain) NSString *titleText;
@property (nonatomic, retain) NSString *imageURL;
@property (nonatomic, retain) NSArray *eventList;
@property (nonatomic, retain) NSMutableArray *events;

@end
