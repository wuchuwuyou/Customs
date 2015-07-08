//
//  MWAPIHelper.h
//  Customs
//
//  Created by Tiny on 15/6/29.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MWAPIHelper : NSObject
/// 首页

/// 进出口税则查询
+ (NSString *)tariffListURL;


/// 税则商品及品目注释
+ (NSString *)goodsTariffItemURL;
+ (NSString *)goodsDetailURL;
/// 本国子目
+ (NSString *)nativeSubItemURL;
/// 重点商品
+ (NSString *)goodsKeyURL;
/// 归类查询
+ (NSString *)GLJDListURL;

/// 化验状态
+ (NSString *)labStatusURL;
@end
