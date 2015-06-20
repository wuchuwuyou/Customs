//
//  MWIAETViewController.m
//  Customs
//
//  Created by Tiny on 15/6/11.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWIAETViewController.h"
#import "MWInputView.h"
@interface MWIAETViewController ()

@property (nonatomic,weak) IBOutlet MWInputView *inputCode;

@end

@implementation MWIAETViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.inputCode.text = @"相关编号";
//    self.inputCode.isShow = YES;
    
    [self.inputCode titleText:@"相关       编号"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
