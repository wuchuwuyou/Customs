//
//  MWTariffListViewModel.h
//  Customs
//
//  Created by Tiny on 15/6/29.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import <RVMViewModel.h>
#import "MWTariffModel.h"
#import "MWListDataModel.h"
///列表数据模型
@interface MWTariffListViewModel : RVMViewModel 

@property (nonatomic,strong) RACSignal *updatedContentSignal;

@property (nonatomic,strong,readonly) NSArray *listArray;

- (instancetype)initWithModel:(MWTariffModel *)model;

@end
