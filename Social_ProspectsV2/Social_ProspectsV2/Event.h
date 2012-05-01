//
//  Event.h
//  Social_ProspectsV2
//
//  Created by Minh Nguyen on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *rating;
@property (nonatomic, copy) NSMutableArray *comments;

@end
