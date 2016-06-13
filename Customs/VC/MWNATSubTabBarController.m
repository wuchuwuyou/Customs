//
//  MWNATSubTabBarController.m
//  Customs
//
//  Created by Tiny on 15/7/6.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWNATSubTabBarController.h"
#import "MWWebViewController.h"
@interface MWNATSubTabBarController ()
@property (nonatomic,strong) MWWebViewController *subVC;
@property (nonatomic,strong) MWWebViewController *relateVC;
@end

@implementation MWNATSubTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.subVC = [[[NSBundle mainBundle] loadNibNamed:@"MWWebViewController" owner:nil options:nil] lastObject];
//    self.subVC.content = self.model.CODE_ARTICLE;
//    self.subVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"sub_annotation", @"子目注释") image:[UIImage imageNamed:@"zimu"] selectedImage:[UIImage imageNamed:@"zimuhover"]];
    
    self.subVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"sub_annotation", @"子目注释") image:[UIImage imageNamed:@"zimu"] selectedImage:nil];

//    self.subVC.title = NSLocalizedString(@"sub_annotation", @"子目注释");
    self.relateVC = [[[NSBundle mainBundle] loadNibNamed:@"MWWebViewController" owner:nil options:nil] lastObject];
//    self.relateVC.content  = self.model.PERT_CONTENT;
    self.relateVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"relate_content", @"相关内容") image:[UIImage imageNamed:@"neirong"] selectedImage:nil];

//    self.relateVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"relate_content", @"相关内容") image:[UIImage imageNamed:@"neirong"] selectedImage:[UIImage imageNamed:@"neironghover"]];

//    self.relateVC.title = NSLocalizedString(@"relate_content", @"相关内容");
    
    self.viewControllers = @[self.subVC,self.relateVC];
    self.selectedIndex = 0;
    
    
    [RACObserve(self, model) subscribeNext:^(id x) {
        self.subVC.content = self.model.CONTECT_SEARCH;
        self.relateVC.content = self.model.PERT_CONTENT;
    }];
    self.title = @"本国子目查询";
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
