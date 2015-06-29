//
//  MWAPIManager.h
//  Customs
//
//  Created by Tiny on 15/6/29.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import <AFHTTPSessionManager+RACSupport.h>
@interface MWAPIManager : AFHTTPSessionManager

+ (instancetype)sharedManager;
- (RACSignal *)requestWithPath:(NSString *)path andParameters:(NSDictionary *)params;

@end
