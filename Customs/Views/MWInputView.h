//
//  MWInputView.h
//  Customs
//
//  Created by Tiny on 15/6/19.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MWInputView : UIView

///输入框内容
@property (nonatomic,readonly,strong) NSString *inputText;

@property (nonatomic,strong) RACSignal *inputTextSignal;
@property (nonatomic,strong) NSString *text;
@property (nonatomic,assign) BOOL isShow;

- (instancetype) initWithText:(NSString *)text andShowLeftView:(BOOL)isShow;
- (void)titleText:(NSString *)text;

- (void)clearContent;
@end
