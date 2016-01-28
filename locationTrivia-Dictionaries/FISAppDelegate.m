//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

-(NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length{
    NSString *name = location[@"name"];
    if (length > [name length]) {
        length = [name length];
    }
    return [name substringToIndex:length];
}

-(NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude{
    return @{@"name": name,
             @"latitude": @(latitude),
             @"longitude": @(longitude)};
}

-(NSArray *)namesOfLocations:(NSArray *)locations{
    return [locations valueForKey:@"name"];
}

-(BOOL)dictionaryIsValidLocation:(NSDictionary *)dict{
    NSSortDescriptor *sortAsc = [NSSortDescriptor sortDescriptorWithKey:@"self"
                                                              ascending:YES
                                                               selector:@selector(caseInsensitiveCompare:) ];
    return [[[dict allKeys] sortedArrayUsingDescriptors:@[sortAsc]] isEqualToArray:[@[@"name", @"latitude", @"longitude"] sortedArrayUsingDescriptors:@[sortAsc]]];
}

-(NSArray *)locationNamed:(NSString *)name inLocations:(NSArray *)locations{
    NSPredicate *namePredicate = [NSPredicate predicateWithFormat:@"name == %@", name];
    NSArray *matchingLocations = [locations filteredArrayUsingPredicate:namePredicate];
    if ([matchingLocations count]) {
        return matchingLocations[0];
    }
    else {
        return nil;
    }
}

@end
