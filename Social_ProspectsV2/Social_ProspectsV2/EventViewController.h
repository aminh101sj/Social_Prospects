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
    
    NSString *bioText;
    NSString *imageURL;
    NSString *titleText;
}
@property (nonatomic, retain) IBOutlet UILabel *bio;
@property (nonatomic, retain) IBOutlet UIImageView *image;
@property (nonatomic, retain) NSString *bioText;
@property (nonatomic, retain) NSString *imageURL;
@property (nonatomic, retain) NSString *titleText;
@end
