//
//  MWLocalStorage.m
//  Customs
//
//  Created by Murphy on 16/6/2.
//  Copyright © 2016年 Murphy. All rights reserved.
//

#import "MWLocalStorage.h"

static  NSString *  const attentionString = @"com.customs.key.attention";

@implementation MWLocalStorage
+ (void)registerDefaultParams {
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{attentionString:[NSArray array]}];
}
+ (BOOL)addAttentionWithEntryID:(NSString *)str {
     NSArray *arr = [[NSUserDefaults standardUserDefaults] objectForKey:attentionString];
    NSMutableArray *array;
    if (arr) {
        array = [NSMutableArray arrayWithArray:arr];
    }else {
        array = [NSMutableArray array];
    }
    [array addObject:str];
    [[NSUserDefaults standardUserDefaults] setObject:array forKey:attentionString];
    return [[NSUserDefaults standardUserDefaults] synchronize];
}
+ (BOOL)removeAttentionWithEntryID:(NSString *)str {
    NSArray *arr = [[NSUserDefaults standardUserDefaults] objectForKey:attentionString];
    NSMutableArray *array;
    if (arr) {
        array = [NSMutableArray arrayWithArray:arr];
    }else {
        array = [NSMutableArray array];
    }
    NSString *search;
    for (NSString *s in array) {
        if ([s isEqualToString:str]) {
            search = s;
            break;
        }
    }
    if (search) {
        [array removeObject:search];
    }
    [[NSUserDefaults standardUserDefaults] setObject:array forKey:attentionString];
    return [[NSUserDefaults standardUserDefaults] synchronize];
}
+ (BOOL)isAttentioned:(NSString *)orderID {
    NSArray *arr = [self allAttentions];
    for (NSString *s in arr) {
        if ([s isEqualToString:orderID]) {
            return YES;
//            break;
        }
    }
    return NO;
}
+ (NSArray<NSString *> *)allAttentions {
    NSArray *arr = [[NSUserDefaults standardUserDefaults] objectForKey:attentionString];
    return arr;
}
@end
