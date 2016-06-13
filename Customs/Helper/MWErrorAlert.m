//
//  MWErrorAlert.m
//  Customs
//
//  Created by Murphy on 16/6/13.
//  Copyright © 2016年 Murphy. All rights reserved.
//

#import "MWErrorAlert.h"

@implementation MWErrorAlert
+ (BOOL)hasErrorMessageWithDict:(NSDictionary *)dict {
    BOOL hasError = NO;
    if (!dict) {
        [SVProgressHUD showErrorWithStatus:@"请求结果出错！"];
        return YES;
    }
    NSArray *arr = dict.allKeys;
    if ([arr containsObject:@"ErrCode"]) {
        if ([[[dict objectForKey:@"ErrCode"] stringValue] isEqualToString:@"0"]) {
            NSString *msg = [dict objectForKey:@"Msg"];
            [SVProgressHUD showInfoWithStatus:msg];
            hasError = YES;
        }else {
            hasError = NO;
        }
    }else {
        hasError = NO;
    }
    return hasError;
}
@end
