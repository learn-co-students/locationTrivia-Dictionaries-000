//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

-(NSString *) stringByTruncatingNameOfLocation: (NSDictionary *) location
                                      toLength: (NSUInteger) length{
    
    NSString *name = location [@"name"];
    
    if (length>name.length) {
        return name;
    }
    
    NSString *shortName = [name substringToIndex:length];
    return shortName;
}

-(NSDictionary *) dictionaryForLocationWithName: (NSString *) name
                                       latitude: (CGFloat) latitude
                                      longitude: (CGFloat) longitude{
   
    NSMutableDictionary *locationWithName = [[NSMutableDictionary alloc] init];
    NSNumber *numLong = [NSNumber numberWithDouble:longitude];
    NSNumber *numLat = [NSNumber numberWithDouble:latitude];

    [locationWithName setObject:name forKey:@"name"];
    [locationWithName setObject:numLong forKey:@"longitude"];
    [locationWithName setObject:numLat forKey:@"latitude"];

    return locationWithName;
}

-(NSArray *) namesOfLocations: (NSArray *)locations{
    
    NSMutableArray *allNames = [[NSMutableArray alloc] init];
    
    for (NSDictionary *location in locations) {
        NSString *name = location[@"name"];
        [allNames addObject:name];
    }
    
    return allNames;
    
}

-(BOOL) dictionaryIsValidLocation: (NSDictionary *) dictionary{
    
    if (dictionary.count !=3 ) {
        return NO;
    }
    
    NSString *name = dictionary[@"name"];
    NSNumber *latitude = dictionary[@"latitude"];
    NSString *longitude = dictionary[@"longitude"];
   
    if (!name) {
        return NO;
    }
    
    if  (name.length == 0){
        return NO;
    }
    
    if (!latitude) {
        return NO;
    }
    
    CGFloat lat = [latitude floatValue];
    
    if (!longitude) {
        return NO;
    }
    if (lat>90 || lat<-90) {
        return NO;
    }
    
    return YES;
}

-(NSDictionary *) locationNamed: (NSString *) name
                    inLocations: (NSArray *) locations{
    
    for (NSDictionary *location in locations) {
        NSString *locNames = location[@"name"];
        if ([locNames isEqualToString:name]) {
            return location;
        }
    }
    
    return nil;
}

@end
