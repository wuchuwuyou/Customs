//
//  MWTCINTabBarViewController.m
//  Customs
//
//  Created by Tiny on 15/7/10.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWTCINTabBarViewController.h"
#import "MWWebViewController.h"
#import "MWIAETTDataViewController.h"
@interface MWTCINTabBarViewController ()
@property (nonatomic,strong) MWWebViewController *vc1;
@property (nonatomic,strong) MWWebViewController *vc2;
@property (nonatomic,strong) MWWebViewController *vc3;
@property (nonatomic,strong) MWIAETTDataViewController *vc4;
@end

@implementation MWTCINTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.vc1 = [[[NSBundle mainBundle] loadNibNamed:@"MWWebViewController" owner:nil options:nil] lastObject];
    //    self.subVC.content = self.model.CODE_ARTICLE;
    self.vc1.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"classAnnotation", @"类注释") image:[UIImage imageNamed:@"leizhu"] selectedImage:[UIImage imageNamed:@"leizhuhover"]];
//    self.vc1.title = NSLocalizedString(@"classAnnotation", @"类注释");
    
    
    self.vc2 = [[[NSBundle mainBundle] loadNibNamed:@"MWWebViewController" owner:nil options:nil] lastObject];
    //    self.relateVC.content  = self.model.PERT_CONTENT;
    self.vc2.tabBarItem = [[UITabBarItem alloc] initWithTitle: NSLocalizedString(@"chapterAnnotation", @"章注释") image:[UIImage imageNamed:@"zhangzhu"] selectedImage:[UIImage imageNamed:@"zhangzhuhover"]];

//    self.vc2.title = NSLocalizedString(@"chapterAnnotation", @"章注释");
    
    
    
    self.vc3 = [[[NSBundle mainBundle] loadNibNamed:@"MWWebViewController" owner:nil options:nil] lastObject];
    //    self.relateVC.content  = self.model.PERT_CONTENT;
    self.vc3.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"itemAnnotation", @"品目注释") image:[UIImage imageNamed:@"pinmu"] selectedImage:[UIImage imageNamed:@"pinmuhover"]];
    
    
    
    self.vc4 = [[MWIAETTDataViewController alloc] initWithStyle:UITableViewStylePlain];
    self.vc4.viewModel = [[MWTariffListViewModel alloc] init];
    self.vc4.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"shuimujiegou", @"税目结构") image:[UIImage imageNamed:@"1"] selectedImage:[UIImage imageNamed:@"2"]];

    


//    self.vc3.title = NSLocalizedString(@"itemAnnotation", @"品目注释");
    self.viewControllers = @[self.vc1,self.vc2,self.vc3,self.vc4];
    self.selectedIndex = 0;

    [RACObserve(self, model) subscribeNext:^(id x) {
        if (!x) {
            return ;
        }
        self.vc1.content = self.model.classAnnotation;
        self.vc2.content = self.model.chapterAnnotation;
        self.vc3.content = self.model.itemAnnotation;
        
        NSString *data = self.model.shuimujiegou;
        NSData *jsonData = [data dataUsingEncoding:NSUTF8StringEncoding];
        NSError *err;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
        if (err) {
            NSLog(@"%@",err);
        }else {
            NSArray *array  = [dic objectForKey:@"CLS00003"];
            self.vc4.viewModel.listArray = [self.vc4.viewModel modelArrayWithArray:array];
        }

    }];
    self.title = @"品目注释查询";
    [self initValue];
}
- (void)initValue {
    // 判断ViewController的层级
    // 如果不是第一级界面, 显示返回按钮
    //    NSInteger count = self.navigationController.viewControllers.count;
    //    if (count > 1) {
    UIButton *backBtn = [[UIButton alloc] init];
    [backBtn setFrame:CGRectMake(0, 0, 36, 36)];
    [backBtn setImage:[UIImage imageNamed:@"btn_back"] forState:UIControlStateNormal];
    [backBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [backBtn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    //    }
    
}

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
