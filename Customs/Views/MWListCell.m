//
//  MWListCell.m
//  Customs
//
//  Created by Tiny on 15/6/23.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWListCell.h"

@interface MWListCell ()
@property (weak,nonatomic) IBOutlet UILabel *codeLabel;
@property (weak,nonatomic) IBOutlet UILabel *nameLabel;
@property (weak,nonatomic) IBOutlet UILabel *rateLabel;

@end

@implementation MWListCell

- (void)configCellWithLeft:(NSString *)lf mid:(NSString *)mid right:(NSString *)rg{
    self.codeLabel.text = lf;
    self.nameLabel.text = mid;
    self.rateLabel.text = rg;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
