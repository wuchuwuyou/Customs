//
//  MWSingleTextField.m
//  Customs
//
//  Created by Tiny on 15/6/11.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWSingleTextField.h"
#import "MWConst.h"
#import "MWHelper.h"
static CGFloat promptWith = 60.0;
@interface MWSingleTextField () <UITextFieldDelegate>
@property (nonatomic,strong) NSString *promptName;
@property (nonatomic,strong) UILabel *promptLabel;
@end

@implementation MWSingleTextField

- (void)awakeFromNib{
    [self layoutViews];
}

- (instancetype)initWithPromptText:(NSString *)text{
    self.promptName = text;
    return [self init];
}
- (instancetype)init{
    
    if (self = [super init]) {
        [self layoutViews];
    }
    
    return self;
}
- (void)layoutViews{
    CGFloat width = promptWith;
    
//    UILabel*label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, self.frame.size.height)];
//    self.promptLabel = label;
//    self.promptLabel.backgroundColor = INPUT_FIELD_COLOR;
//    self.promptLabel.font = [MWFontHelper titleFont];
//    self.promptLabel.text = self.promptName;
//    self.promptLabel.numberOfLines = 2;
//    self.promptLabel.lineBreakMode = NSLineBreakByCharWrapping;
//    self.promptLabel.textAlignment = NSTextAlignmentCenter;
//    self.leftView = self.promptLabel;
    
    self.promptLabel.textColor = [UIColor whiteColor];
    self.textColor = [UIColor colorWithRed:0.000 green:0.000 blue:0.000 alpha:1.00];
    self.leftViewMode = UITextFieldViewModeAlways;
//    self.backgroundColor = INPUT_BACKGROUND_COLOR;
    self.backgroundColor = [UIColor clearColor];
}
- (void)layoutSubviews {
    [super layoutSubviews];
//    self.promptLabel.frame = CGRectMake(0, 0, promptWith, self.frame.size.height);
    
}
- (void)titleText:(NSString *)text{
    if (text && text.length > 0) {
        self.promptLabel.text = text;
    }else {
        self.leftView = nil;
    }
}

- (CGRect)editingRectForBounds:(CGRect)bounds{
    return CGRectMake(bounds.origin.x + 10, bounds.origin.y, bounds.size.width - 10, bounds.size.height);
}
- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectMake(bounds.origin.x + 10, bounds.origin.y, bounds.size.width - 10, bounds.size.height);
}

//- (void)setPromptName:(NSString *)promptName{
//    if (_promptName != promptName) {
//        _promptName = promptName;
//    }
//    if (_promptName == nil) {
//        self.leftView = nil;
//    }
//}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
