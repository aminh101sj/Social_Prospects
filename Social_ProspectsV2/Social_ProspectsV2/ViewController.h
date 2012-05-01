//
//  ViewController.h
//  Social_ProspectsV2
//
//  Created by Minh Nguyen on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController {
    NSArray *eventList;
//    IBOutlet UITableView *tableView;
//    NSInteger index;
@private
    BOOL _didDownloadData;
    
    NSArray *_dataArray;
}

//@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSArray *eventList;
//@property (nonatomic) NSInteger index;

@end
