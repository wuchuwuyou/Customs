//
//  MWIAETTableViewController.h
//  Customs
//
//  Created by Tiny on 15/6/23.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWBaseTableViewController.h"
#import "MWTariffModel.h"
#import "MWTariffListViewModel.h"
@interface MWIAETTableViewController : MWBaseTableViewController


@property (nonatomic,strong) MWTariffListViewModel *viewModel;

@end
