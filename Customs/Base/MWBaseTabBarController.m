//
//  MWBaseTabBarController.m
//  Customs
//
//  Created by Tiny on 15/7/6.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWBaseTabBarController.h"

@interface MWBaseTabBarController ()

@end

@implementation MWBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBar.barTintColor = [UIColor colorWithRed:1.000f green:1.000f blue:1.000f alpha:1.00f];
    self.tabBar.tintColor = [UIColor colorWithRed:0.282f green:0.694f blue:0.839f alpha:1.00f];
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
