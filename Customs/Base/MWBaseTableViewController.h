//
//  MWBaseTableViewController.h
//  Customs
//
//  Created by Tiny on 15/6/23.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MWDetailListTableViewCell.h"

@interface MWBaseTableViewController : UITableViewController
- (void)endRefresh;
- (void)showError:(NSError *)error;
@end
