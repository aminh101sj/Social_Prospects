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
    NSMutableArray *eventLocations;
//    NSInteger index;
@private
    BOOL _didDownloadData;
    
    NSMutableArray *_dataArray;
}

@property (nonatomic, retain) NSArray *eventList;
@property (nonatomic, retain) NSArray *eventLocations;
//@property (nonatomic) NSInteger index;

@end
