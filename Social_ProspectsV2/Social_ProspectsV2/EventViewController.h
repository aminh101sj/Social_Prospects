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
    
}
@property (nonatomic, retain) IBOutlet UILabel *bio;

@end
