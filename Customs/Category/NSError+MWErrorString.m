//
//  NSError+MWErrorString.m
//  Customs
//
//  Created by Tiny on 15/6/30.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "NSError+MWErrorString.h"

@implementation NSError (MWErrorString)
- (NSString *)errorString{
    return NSLocalizedString(@"network_error", @"网络错误");
}
@end
