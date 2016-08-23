//
//  NSDictionary+MWJSONTransform.m
//  Customs
//
//  Created by Tiny on 15/6/30.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "NSDictionary+MWJSONTransform.h"

@implementation NSDictionary (MWJSONTransform)
- (NSString *)getJSONString{
    
    NSArray *keys = self.allKeys;
    if (keys.count == 0) {
        return @"";
    }
    NSError *parseError = nil;

    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&parseError];
    
    if (parseError) {
        NSAssert(parseError, @"字典转化json字符串出错");
    }
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];

}
@end
