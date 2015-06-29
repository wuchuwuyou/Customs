//
//  MWTariffListViewModel.m
//  Customs
//
//  Created by Tiny on 15/6/29.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWTariffListViewModel.h"
#import "MWAPIManager.h"
@interface MWTariffListViewModel ()
@property (nonatomic,strong) MWTariffModel *tModel;
@end

@implementation MWTariffListViewModel

- (instancetype)initWithModel:(MWTariffModel *)model{
    
    if (self = [super init]) {
        self.tModel = model;
    }
    return self;
}

@end
