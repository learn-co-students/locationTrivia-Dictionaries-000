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

//empireState = @{ @"name"      : empireStateName,
//                 @"latitude"  : @(empireStateLat) ,
//                 @"longitude" : @(empireStateLng)
//                 };

-(NSString *)stringByTruncatingNameOfLocation:(NSDictionary*) location toLength:(NSUInteger) length{
    if (length <= [location[@"name"] length]){
        NSString *shortenedName = [location[@"name"] substringToIndex:length];
        return shortenedName;
    } else {
        return location[@"name"];
    }
        
}

-(NSDictionary*)dictionaryForLocationWithName:(NSString *) name latitude:(CGFloat) latitude longitude:(CGFloat) longitude{
    NSDictionary *location = @{  @"name"  : name,
                                @"latitude" : @(latitude),
                                @"longitude" : @(longitude) };
    return location;
}

-(NSArray *)namesOfLocations:(NSArray *) locations{
    NSMutableArray *nameArray = [@[] mutableCopy];
    for (NSDictionary *location in locations) {
        [nameArray addObject:location[@"name"]];
    }
    return nameArray;
}

-(BOOL)dictionaryIsValidLocation:(NSDictionary *) location{
    if ([location count] == 3 && [[location allKeys] containsObject:@"name"] && [[location allKeys] containsObject:@"latitude"] && [[location allKeys] containsObject:@"longitude"]) {
        return YES;
    } else {
        return NO;
    }
}

-(NSDictionary *)locationNamed:(NSString *) name inLocations:(NSArray *) locations{
    for (NSDictionary *location in locations) {
        if ([location[@"name"] isEqualToString:name]){
            return location;
        }

    }
    return nil;
}


@end
