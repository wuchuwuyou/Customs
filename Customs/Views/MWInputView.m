//
//  MWInputView.m
//  Customs
//
//  Created by Tiny on 15/6/19.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWInputView.h"
#import "MWSingleTextField.h"

static CGFloat promptWith = 110.0;

@interface MWInputView () <UITextFieldDelegate>
@property (nonatomic,strong) UILabel *promptLabel;

@property (nonatomic,strong) MWSingleTextField *stf;
@property (nonatomic,strong) UIImage *inputImage;
@property (nonatomic,strong) UIImage *noInputImage;
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
    
    CGFloat labelWidth = promptWith;
    
    if (!self.text || self.text.length == 0) {
        labelWidth = 0;
    }
    
    self.stf = [[MWSingleTextField alloc] initWithPromptText:self.text];
    
    UILabel*label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, self.bounds.size.height)];
    self.promptLabel = label;
    self.promptLabel.backgroundColor = [UIColor colorWithRed:0.071 green:0.431 blue:0.624 alpha:1.00];
//    self.promptLabel.backgroundColor = [UIColor colorWithRed:0.243 green:0.243 blue:0.224 alpha:1.00];
    self.promptLabel.font = [MWFontHelper titleFont];
    self.promptLabel.text = self.text;
    self.promptLabel.numberOfLines = 1;
    self.promptLabel.lineBreakMode = NSLineBreakByCharWrapping;
    self.promptLabel.textAlignment = NSTextAlignmentCenter;
//    self.promptLabel.minimumScaleFactor = 0.2;
    //    self.promptLabel.frame = CGRectMake(0, self.bounds.origin.y, labelWidth, self.bounds.size.height);
    self.promptLabel.textColor = [UIColor whiteColor];
//    self.backgroundColor = INPUT_BACKGROUND_COLOR;
    self.backgroundColor = [UIColor clearColor];

    self.stf.delegate = self;
    self.stf.frame = CGRectMake(labelWidth , self.bounds.origin.y, self.bounds.size.width-labelWidth , self.bounds.size.height);
//    self.stf.frame =self.bounds;
    [self addSubview:self.stf];
    
    
    
    [self addSubview:self.promptLabel];
    //传入参数 object 制定对应的对象
    
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didBeginEditing:) name:UITextFieldTextDidBeginEditingNotification object:self.stf];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didEndEditing:) name:UITextFieldTextDidEndEditingNotification object:self.stf];
    
    self.inputTextSignal = self.stf.rac_textSignal;
    
    self.inputImage = [UIImage imageNamed:@"input"];
    self.noInputImage = [UIImage imageNamed:@"no_input"];
    self.inputImage = [self.inputImage resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5) resizingMode:UIImageResizingModeTile];
    self.noInputImage = [self.noInputImage resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5) resizingMode:UIImageResizingModeTile];
    
    self.stf.background = self.noInputImage;
    [self.stf.rac_textSignal subscribeNext:^(NSString *text) {
        _inputText = text;
    }];
    
}
- (void)layoutSubviews {
    [super layoutSubviews];
//    self.stf.frame = self.bounds;
    
    CGFloat labelWidth = promptWith;
    
    if (!self.text || self.text.length == 0) {
        labelWidth = 0;
    }
    
    self.stf.frame = CGRectMake(labelWidth, self.bounds.origin.y, self.bounds.size.width-labelWidth, self.bounds.size.height);
    self.promptLabel.frame = CGRectMake(0, self.bounds.origin.y, labelWidth, self.bounds.size.height);

}
- (void)titleText:(NSString *)text {
    self.text = text;
    self.promptLabel.text = text;
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
    _inputText = @"";
}

/// notification  textfield
//在下面添加输入框背景变化
- (void)didBeginEditing:(NSNotification *)noti{
    //    ((MWInputView*)(noti.object)).stf.backgroundColor = [UIColor redColor];
    ((UITextField *)noti.object).background = self.inputImage;
    NSLog(@"出现焦点");
}
- (void)didEndEditing:(NSNotification *)noti{
    //   ((MWInputView*)(noti.object)).stf.backgroundColor = [UIColor greenColor];
    ((UITextField *)noti.object).background = self.noInputImage;
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
