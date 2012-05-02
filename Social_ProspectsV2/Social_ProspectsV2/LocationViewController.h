//
//  LocationViewController.h
//  Social_ProspectsV2
//
//  Created by Minh Nguyen on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationViewController : UIViewController {
    IBOutlet UILabel *locName;
    IBOutlet UILabel *locDesc;

    NSString *data;
    NSString *titleText;
    NSString *locAddress;
    NSString *locDescription;
    NSString *imgURL;
}

-(IBAction)mapIt:(id)sender;

@property (nonatomic, retain) IBOutlet UILabel *locName;
@property (nonatomic, retain) IBOutlet UILabel *locDesc;
@property (nonatomic, retain) NSString *data;
@property (nonatomic, retain) NSString *titleText;
@property (nonatomic, retain) NSString *locAddress;
@property (nonatomic, retain) NSString *imgUrl;
@property (nonatomic, retain) NSString *locDescription;

@end
