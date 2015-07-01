//
//  MWCommonDataHelper.h
//  Customs
//
//  Created by Tiny on 15/7/1.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MWTariffListDataModel.h"
@interface MWCommonDataHelper : NSObject

+ (instancetype)sharedManager;

- (NSArray *)tariffListWithModel:(MWTariffListDataModel*)model;
@end
