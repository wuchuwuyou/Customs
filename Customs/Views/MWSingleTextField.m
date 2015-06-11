//
//  MWSingleTextField.m
//  Customs
//
//  Created by Tiny on 15/6/11.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWSingleTextField.h"
#import "MWConst.h"
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
    UILabel*label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, promptWith, self.frame.size.height)];
    self.promptLabel = label;
    self.promptLabel.backgroundColor = INPUT_FIELD_COLOR;
    self.promptLabel.text = self.promptName;
    self.leftView = self.promptLabel;
    self.leftViewMode = UITextFieldViewModeAlways;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
