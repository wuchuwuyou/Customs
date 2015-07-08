//
//  MWLabViewModel.h
//  Customs
//
//  Created by Tiny on 15/7/8.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "RVMViewModel.h"

@interface MWLabViewModel : RVMViewModel
- (instancetype) initWithOrderNo:(NSString *)orderNo;
- (RACSignal *)requestData;

@end
