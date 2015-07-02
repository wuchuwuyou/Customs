//
//  MWDetailListTableViewCell.h
//  Customs
//
//  Created by Tiny on 15/7/2.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MWDetailListTableViewCell : UITableViewCell
- (void)configCellWithTitle:(NSString *)title content:(NSString *)content;
- (CGRect)contentRect;
@end
