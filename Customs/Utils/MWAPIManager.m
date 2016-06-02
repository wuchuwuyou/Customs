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
        AFHTTPRequestSerializer * requestSerializer = [AFHTTPRequestSerializer serializer];
//        [requestSerializer setValue:@"your user agent" forHTTPHeaderField:@"User-Agent"];
        instance.requestSerializer = requestSerializer;
        instance.responseSerializer = [AFHTTPResponseSerializer new];

//        instance.responseSerializer = [AFXMLParserResponseSerializer serializer];
//        instance.requestSerializer = [AFHTTPRequestSerializer serializer];
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"text/xml",@"application/soap+xml",@"application/xml",nil];
        
    });
    return instance;
}
- (RACSignal *)requestWithPath:(NSString *)path andParameters:(NSDictionary *)params{
    return [self rac_POST:path parameters:params];
//    return [self rac_GET:path parameters:params];
}
@end
