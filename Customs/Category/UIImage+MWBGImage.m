//
//  UIImage+MWBGImage.m
//  Customs
//
//  Created by Murphy on 15/8/27.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "UIImage+MWBGImage.h"
#import <UIDevice+HardwareName.h>
@implementation UIImage (MWBGImage)
+ (UIImage *)getBGImage{
    NSUInteger type = [[UIDevice currentDevice] platformType];
    switch (type) {
        case UIDevice4iPhone:
            return [UIImage imageNamed:@"bg_640_960"];
            break;
        case UIDevice4SiPhone:
            return [UIImage imageNamed:@"bg_640_960"];
            break;
        case UIDevice5iPhone:
            return [UIImage imageNamed:@"bg_640_1136"];

            break;
        case UIDevice5CiPhone:
            return [UIImage imageNamed:@"bg_640_1136"];

            break;
        case UIDevice5SiPhone:
            return [UIImage imageNamed:@"bg_640_1136"];

            break;
        case UIDevice6iPhone:
            return [UIImage imageNamed:@"bg_750_1334"];

            break;
        case UIDevice6PlusiPhone:
            return [UIImage imageNamed:@"bg_1080_1920"];
            break;
        default:
            return [UIImage imageNamed:@"bg"];
            break;
    }
}
@end
