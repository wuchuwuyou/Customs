//
//  MWFontHelper.m
//  Customs
//
//  Created by Tiny on 15/6/11.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWFontHelper.h"

@implementation MWFontHelper
+ (UIFont *)titleFont{
    return [UIFont systemFontOfSize:[[self alloc] titleFontSize]];
}
- (CGFloat)titleFontSize{
    return 14.0 * [self fontScale];
}
- (CGFloat)fontScale{
    return 1.0f;
}
@end
