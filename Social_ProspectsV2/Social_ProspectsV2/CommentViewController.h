//
//  CommentViewController.h
//  Social_ProspectsV2
//
//  Created by Greg Mathews on 5/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentViewController : UIViewController{
    IBOutlet UILabel *commentText;
    IBOutlet UILabel *commenterName;
    IBOutlet UIImageView *imageUrl;
    NSString *commentData;
    NSString *nameData;
    NSString *imageData;
}
-(IBAction)mapIt:(id)sender;
@property (nonatomic, retain) IBOutlet UILabel *commentText;
@property (nonatomic, retain) IBOutlet UILabel *commenterName;
@property (nonatomic, retain) IBOutlet UIImageView *imageUrl;
@property (nonatomic, retain) NSString *commentData;
@property (nonatomic, retain) NSString *nameData;
@property (nonatomic, retain) NSString *imageData;
@end
