//
//  FISAppDelegate.m
//  locationTrivia-Dictionaries
//
//  Created by Joe Burgess on 5/13/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

/** 
 
 *  Write your method implementations here.
 
 */

-(NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location
                                     toLength:(NSUInteger)length{
    if (length < [location[@"name"] length]) {
        NSString *subString = [location[@"name"] substringToIndex:(length)];
        return subString;
    };
    return location[@"name"];
};

-(NSDictionary *)dictionaryForLocationWithName:(NSString *)name
                                      latitude:(CGFloat)latitude
                                     longitude:(CGFloat)longitude{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    dictionary[@"name"] = name;
    dictionary[@"latitude"] = @(latitude);
    dictionary[@"longitude"] = @(longitude);
    
    NSLog(@"%@", dictionary);
    return dictionary;
};

-(NSArray *)namesOfLocations:(NSArray *)locations{
    NSMutableArray *locationNamesArray = [NSMutableArray array];
    for (id object in locations) {
        [locationNamesArray addObject:object[@"name"]];
    }
    return locationNamesArray;
};

-(BOOL)dictionaryIsValidLocation:(NSDictionary *)location{

    NSArray *arrayToMatch = @[@"name",
                             @"latitude",
                             @"longitude"];
    
    if([[[location allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)] isEqualToArray:[arrayToMatch sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)]]){
        return YES;
    }
    return NO;
};

-(NSDictionary *)locationNamed:(NSString *)name
                   inLocations:(NSArray *)locations{
    NSLog(@"%@", locations);
    NSDictionary *returnDictionary = [NSDictionary dictionary];
    for (NSDictionary *location in locations){
        if ([location[@"name"] isEqualToString:name]){
            returnDictionary = location;
        } if ([returnDictionary count]>0){
            return returnDictionary;
        } 
    };
    return nil;
};



@end
