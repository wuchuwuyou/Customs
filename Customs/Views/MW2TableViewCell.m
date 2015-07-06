//
//  MW2TableViewCell.m
//  Customs
//
//  Created by Tiny on 15/7/6.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MW2TableViewCell.h"

@interface MW2TableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *leftLabel;

@property (weak, nonatomic) IBOutlet UILabel *rightLabel;


@end

@implementation MW2TableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)configCellWithLeftTitle:(NSString *)lf right:(NSString *)rg{
    self.leftLabel.text = lf;
    self.rightLabel.text = rg;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
