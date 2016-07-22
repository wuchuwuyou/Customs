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
+ (NSString *)CHTraiffCommentaryURL {
    return [[self baseURL] stringByAppendingString:MWGoodsCHTraiffCommentary];
}
+ (NSString *)goodsDetailURL{
    return [[self baseURL] stringByAppendingString:MWGoodsDetailPath];
}

+(NSString *)nativeSubItemURL{
    return [[self baseURL] stringByAppendingString:MWNativeSubItemPath];
}


+(NSString *)GLJDListURL{
    return [[self baseURL] stringByAppendingString:MWGLJDListPath];
}


+ (NSString *)goodsKeyURL{
    return [[self baseURL] stringByAppendingString:MWGoodsKeyPath];
}

+ (NSString *)labStatusURL{
    return [[self baseURL] stringByAppendingString:MWLabStatusPath];
}
+ (NSString *)searchURL {
    return [[self baseURL] stringByAppendingString:MWSearchPath];
}
+ (NSString *)baseURL{
//    NSString *host = HOST_NAME;
    return [NSString stringWithFormat:@"%@",HOST_NAME];
}
@end
