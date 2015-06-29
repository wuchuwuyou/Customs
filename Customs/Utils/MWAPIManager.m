//
//  MWAPIManager.m
//  Customs
//
//  Created by Tiny on 15/6/29.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWAPIManager.h"

@implementation MWAPIManager

+ (instancetype)sharedManager{
    
    static MWAPIManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self manager];
    });
    return instance;
}
- (RACSignal *)requestWithPath:(NSString *)path andParameters:(NSDictionary *)params{
    return [self rac_POST:path parameters:params];
}
@end
