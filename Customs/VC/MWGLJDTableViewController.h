//
//  MWGLJDTableViewController.h
//  Customs
//
//  Created by Tiny on 15/7/7.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWBaseTableViewController.h"
#import "MWGLJDViewModel.h"
@interface MWGLJDTableViewController : MWBaseTableViewController

@property (nonatomic,strong) MWGLJDViewModel *viewModel;

@property (nonatomic,assign) MWGLSearchType type;

@end
