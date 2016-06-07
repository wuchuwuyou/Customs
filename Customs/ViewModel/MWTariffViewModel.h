//
//  MWTariffViewModel.h
//  Customs
//
//  Created by Tiny on 15/6/22.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import <RVMViewModel.h>
#import "MWTariffModel.h"
@interface MWTariffViewModel : RVMViewModel
@property (nonatomic,strong,readonly) MWTariffModel *model;
- (instancetype)initWithMWInputViewArray:(NSArray *)arr;
- (instancetype)initWithModel:(MWTariffModel *)model;
@end
