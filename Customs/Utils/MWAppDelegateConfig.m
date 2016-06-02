//
//  MWAppDelegateConfig.m
//  Customs
//
//  Created by Tiny on 15/7/2.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWAppDelegateConfig.h"
#import "MWLocalStorage.h"
@implementation MWAppDelegateConfig
+(instancetype)shared{
    static MWAppDelegateConfig  *instance ;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}
- (void)config{
//    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    [MWLocalStorage registerDefaultParams];

}
@end
