//
//  MWBaseViewController.m
//  Customs
//
//  Created by Tiny on 15/6/9.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWBaseViewController.h"
#import "MWConst.h"
#import <SVProgressHUD.h>
@interface MWBaseViewController ()

@end

@implementation MWBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.



    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage getBGImage]];
    CGSize size = [[UIScreen mainScreen] bounds].size;
    [backgroundImage setFrame:CGRectMake(self.view.bounds.origin.x, self.view.bounds.origin.y, size.width, size.height - 64)];
    backgroundImage.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:backgroundImage];
    [self.view sendSubviewToBack:backgroundImage];
//    [self initValue];
}
#pragma  mark - Private Methods
//- (void)initValue {
//    // 判断ViewController的层级
//    // 如果不是第一级界面, 显示返回按钮
//    NSInteger count = self.navigationController.viewControllers.count;
//    if (count > 1) {
//        UIButton *backBtn = [[UIButton alloc] init];
//        [backBtn setFrame:CGRectMake(0, 0, 36, 36)];
//        [backBtn setImage:[UIImage imageNamed:@"btn_back"] forState:UIControlStateNormal];
//        [backBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
//        [backBtn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
//        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
//        self.navigationItem.leftBarButtonItem = backItem;
//    }
//
//}

#pragma mark - Actions
-(void)back:(UIButton *)sender {
    [SVProgressHUD dismiss];
    [self.navigationController popViewControllerAnimated:YES];
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
