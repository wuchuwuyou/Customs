//
//  MWCommonDataHelper.h
//  Customs
//
//  Created by Tiny on 15/7/1.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MWTariffListDataModel.h"

#import "MWKeyCommoditiesModel.h"

#import "MWGLJDListModel.h"
#import "MWLabModel.h"

@interface MWCommonDataHelper : NSObject

+ (instancetype)sharedManager;

- (NSArray *)tariffListWithModel:(MWTariffListDataModel*)model;

- (NSArray *)keyCommoditiesListWithModel:(MWKeyCommoditiesModel *)model;

- (NSArray *)GLJDListWithModel:(MWGLJDListModel *)model;

- (NSArray *)labStatusWithModel:(MWLabModel *)model;
@end
