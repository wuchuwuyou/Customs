//
//  NSDictionary+MWGetURLString.m
//  Customs
//
//  Created by Tiny on 15/6/30.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "NSDictionary+MWGetURLString.h"

@implementation NSDictionary (MWGetURLString)
- (NSString *)getURLString{
    NSMutableString *url = [NSMutableString string];
    NSArray *keys = [self allKeys];
    NSString *firstKey = [keys firstObject];
    [url appendFormat:@"%@=%@", firstKey, [self objectForKey:firstKey]];
    for (int i = 1; i < [keys count]; i++) {
        [url appendFormat:@"&%@=%@", keys[i], [self objectForKey:keys[i]]];
    }
    return url;

}
@end
