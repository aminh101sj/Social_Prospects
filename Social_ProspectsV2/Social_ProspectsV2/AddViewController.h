//
//  AddViewController.h
//  Social_ProspectsV2
//
//  Created by Alben Cheung on 5/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController{
    NSString *username;
    NSString *userComment;

    IBOutlet UITextField *userBox;
    IBOutlet UITextField *commentBox;
}

@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *userComment;
@property (nonatomic, retain) UITextField *userBox;
@property (nonatomic, retain) UITextField *commentBox;

-(IBAction)submitComment:(id)sender;

@end
