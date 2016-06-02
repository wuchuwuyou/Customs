//
//  MWLocalStorage.h
//  Customs
//
//  Created by Murphy on 16/6/2.
//  Copyright © 2016年 Murphy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MWLocalStorage : NSObject
+ (BOOL)addAttentionWithEntryID:(NSString *)str;
+ (BOOL)removeAttentionWithEntryID:(NSString *)str;
+ (void)registerDefaultParams;
+ (BOOL)isAttentioned:(NSString *)orderID;
+ (NSArray <NSString *> *)allAttentions;
@end
