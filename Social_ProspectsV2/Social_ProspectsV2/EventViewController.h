//
//  EventViewController.h
//  Social_ProspectsV2
//
//  Created by Minh Nguyen on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    IBOutlet UILabel *bio;
    IBOutlet UIImageView *image;
    IBOutlet UITableView *tableView;
    
    NSString *bioText;
    NSString *imageURL;
    NSString *titleText;
    NSArray *eventList;
<<<<<<< HEAD
    NSArray *commentList;
=======
    NSString *eventLoc;
    NSMutableArray *eventLocations;
>>>>>>> df7866940be64cbb77476a6c63aaa17d5fb394da
}
@property (nonatomic, retain) IBOutlet UILabel *bio;
@property (nonatomic, retain) IBOutlet UIImageView *image;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSString *bioText;
@property (nonatomic, retain) NSString *imageURL;
@property (nonatomic, retain) NSString *titleText;
@property (nonatomic, retain) NSArray *eventList;
<<<<<<< HEAD
@property (nonatomic, retain) NSArray *commentList;
=======
@property (nonatomic, retain) NSArray *eventLocations;
@property (nonatomic, retain) NSString *eventLoc;

>>>>>>> df7866940be64cbb77476a6c63aaa17d5fb394da
@end
