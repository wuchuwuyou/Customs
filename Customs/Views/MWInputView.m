//
//  MWInputView.m
//  Customs
//
//  Created by Tiny on 15/6/19.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWInputView.h"
#import "MWSingleTextField.h"


@interface MWInputView () <UITextFieldDelegate>

@property (nonatomic,strong) MWSingleTextField *stf;
@end

@implementation MWInputView
@synthesize inputText = _inputText;
- (instancetype)initWithText:(NSString *)text andShowLeftView:(BOOL)isShow{
    self.text = text;
    self.isShow = isShow;
    return  [self init];
}
- (instancetype)init{
    if (self = [super init]) {
        [self configView];
    }
    return  self;
}
- (void)awakeFromNib{
    [self configView];
}
- (void)configView{
    
    self.stf = [[MWSingleTextField alloc] initWithPromptText:self.text];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didBeginEditing:) name:UITextFieldTextDidBeginEditingNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didEndEditing:) name:UITextFieldTextDidEndEditingNotification object:nil];
    self.stf.delegate = self;
    self.stf.frame = self.bounds;
    [self addSubview:self.stf];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.stf.frame = self.bounds;
}
- (void)titleText:(NSString *)text {
    [self.stf titleText:text];
}
- (void)setIsShow:(BOOL)isShow{
    _isShow = isShow;
    if (self.isShow == NO) {
        self.text = nil ;
    }
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    if ( textField == self.stf) {
        _inputText = textField.text;
    }
}

/// notification  textfield

- (void)didBeginEditing:(NSNotification *)noti{
    NSLog(@"出现焦点");
}
- (void)didEndEditing:(NSNotification *)noti{
    NSLog(@"失去焦点");
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidBeginEditingNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidEndEditingNotification object:nil];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
