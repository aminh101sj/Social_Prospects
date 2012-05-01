//
//  LocationViewController.h
//  Social_ProspectsV2
//
//  Created by Minh Nguyen on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationViewController : UIViewController {
    IBOutlet UILabel *label;
    NSString *data;
    
}

@property (nonatomic, retain) IBOutlet UILabel *label;
@property (nonatomic, retain) NSString *data;
@end
