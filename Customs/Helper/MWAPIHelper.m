//
//  MWAPIHelper.m
//  Customs
//
//  Created by Tiny on 15/6/29.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWAPIHelper.h"

@implementation MWAPIHelper
+ (NSString *)tariffListURL{
    return [[self baseURL] stringByAppendingString:MWTariffListPath];
}
+ (NSString *)goodsTariffItemURL{
    return [[self baseURL] stringByAppendingString:MWGoodsTariffItemPath];
}
+ (NSString *)baseURL{
//    NSString *host = HOST_NAME;
    return [NSString stringWithFormat:@"%@:%d",HOST_NAME,PORT];
}
@end
