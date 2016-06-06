//
//  MWBaseNavigationController.m
//  Customs
//
//  Created by Tiny on 15/6/9.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWBaseNavigationController.h"
#import "MWConst.h"
@interface MWBaseNavigationController ()

@end

@implementation MWBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.navigationBar.tintColor = [UIColor colorWithRed:73.0/255.0 green:176.0/255.0 blue:215.0/255.0 alpha:1];
    self.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationBar.backgroundColor = INPUT_FIELD_COLOR;
    self.navigationBar.barTintColor = INPUT_FIELD_COLOR;
    self.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil];
   
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault]; // Takes out title
    //
    UIImage *backButtonImage = [UIImage imageNamed:@"btn_back"];
    
    if ([UINavigationBar instancesRespondToSelector:@selector(setBackIndicatorImage:)]) {
        [[UINavigationBar appearance] setBackIndicatorImage:backButtonImage];
        [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:backButtonImage];
    } else {
        int imageSize = backButtonImage.size.width; // REPLACE WITH YOUR IMAGE WIDTH
        
        [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[backButtonImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, imageSize, 0, 0)] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
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
