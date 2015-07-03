//
//  MWListCell.m
//  Customs
//
//  Created by Tiny on 15/7/3.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWListCell.h"

@interface MWListCell ()
@property (weak,nonatomic) IBOutlet UILabel *codeLabel;
@property (weak,nonatomic) IBOutlet UILabel *nameLabel;
@property (weak,nonatomic) IBOutlet UILabel *rateLabel;

@end

@implementation MWListCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)configCellWithLeft:(NSString *)lf mid:(NSString *)mid right:(NSString *)rg{
    self.codeLabel.text = lf;
    self.nameLabel.text = mid;
    self.rateLabel.text = rg;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
