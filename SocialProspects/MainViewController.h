//
//  MainViewController.h
//  SocialProspects
//
//  Created by Alben Cheung on 4/1/12.
//  Copyright (c) 2012 Hipsters. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UITableViewController {
    //NSArray *list;
    
    //Data Arrays & Dictionaries 
    NSMutableArray *placesData;
    NSMutableArray *placesList;
    NSMutableDictionary *keyToObject;
    NSMutableDictionary *keyToTitle;
    NSMutableDictionary *titleToKey;
    NSMutableDictionary *urlToKey;
    NSMutableDictionary *keyToUrl;
}

//@property (nonatomic, strong) NSArray *list;
@property (nonatomic, retain) NSMutableArray *placesList;
@property (nonatomic, retain) NSMutableArray *placesData;
@property (nonatomic, retain) NSMutableDictionary *keyToObject;
@property (nonatomic, retain) NSMutableDictionary *keyToTitle;
@property (nonatomic, retain) NSMutableDictionary *titleToKey;
@property (nonatomic, retain) NSMutableDictionary *urlToKey;
@property (nonatomic, retain) NSMutableDictionary *keyToUrl;

@end
