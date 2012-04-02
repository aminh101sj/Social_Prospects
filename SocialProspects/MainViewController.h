//
//  MainViewController.h
//  SocialProspects
//
//  Created by Alben Cheung on 4/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UITableViewController {
    //NSArray *list;
    
    //Places
    NSMutableArray *places;
    
    //Data Arrays & Dictionaries 
    NSArray *placesData;
    NSMutableDictionary *keyToObject;
}

//@property (nonatomic, strong) NSArray *list;
@property (nonatomic, retain) NSMutableArray *places;
@property (nonatomic, retain) NSMutableDictionary *keyToObject;

@end
