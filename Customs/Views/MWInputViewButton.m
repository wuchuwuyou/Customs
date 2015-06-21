//
//  MWInputViewButton.m
//  Customs
//
//  Created by Tiny on 15/6/21.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWInputViewButton.h"
#import "MWFontHelper.h"
@implementation MWInputViewButton
- (void)awakeFromNib{
    [self initView];
}
- (void)initView{
    self.backgroundColor = INPUT_FIELD_COLOR;
    self.layer.cornerRadius = BUTTON_CORNERRADIUS;
//    self.titleLabel.textColor = [UIColor whiteColor];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.titleLabel.font = [MWFontHelper buttonFont];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
