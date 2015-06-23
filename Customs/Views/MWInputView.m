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
    self.stf.delegate = self;
    self.stf.frame = self.bounds;
    [self addSubview:self.stf];
    //传入参数 object 制定对应的对象
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didBeginEditing:) name:UITextFieldTextDidBeginEditingNotification object:self.stf];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didEndEditing:) name:UITextFieldTextDidEndEditingNotification object:self.stf];
    
    self.inputTextSignal = self.stf.rac_textSignal;
    
    [self.stf.rac_textSignal subscribeNext:^(NSString *text) {
        _inputText = text;
    }];
    
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
//- (void)textFieldDidEndEditing:(UITextField *)textField{
//    if ( textField == self.stf) {
//        _inputText = textField.text;
//    }
//}

- (void)clearContent{
    self.stf.text = @"";
}

/// notification  textfield
//在下面添加输入框背景变化
- (void)didBeginEditing:(NSNotification *)noti{
//    ((MWInputView*)(noti.object)).stf.backgroundColor = [UIColor redColor];
    ((UITextField *)noti.object).backgroundColor = [UIColor redColor];
    NSLog(@"出现焦点");
}
- (void)didEndEditing:(NSNotification *)noti{
//   ((MWInputView*)(noti.object)).stf.backgroundColor = [UIColor greenColor];
    ((UITextField *)noti.object).backgroundColor = [UIColor greenColor];
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
