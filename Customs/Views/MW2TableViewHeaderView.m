//
//  MW2TableViewHeaderView.m
//  Customs
//
//  Created by Tiny on 15/7/6.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MW2TableViewHeaderView.h"

@interface MW2TableViewHeaderView ()
@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;

@end

@implementation MW2TableViewHeaderView

- (void)awakeFromNib{
    [self configViews];
}
- (void)setLeftTitle:(NSString *)lf right:(NSString *)rg{
    self.leftLabel.text = lf;
    self.rightLabel.text = rg;
}

- (void)configViews{
    
    UIFont *font = [MWFontHelper headerFont];
    self.leftLabel.font = font;
    self.rightLabel.font = font;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
