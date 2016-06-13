//
//  MWHomeViewController.m
//  Customs
//
//  Created by Tiny on 15/6/11.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWHomeViewController.h"
#import "MWGLJDViewController.h"
#import <SDCycleScrollView.h>
#import "MWLaboratoryListViewController.h"
#import "MWLocalStorage.h"
#import "MWSearchResultTableViewController.h"
@interface MWHomeViewController () <SDCycleScrollViewDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *panelViewHeight;

@property (weak, nonatomic) IBOutlet SDCycleScrollView *bannerView;
@property (weak, nonatomic) IBOutlet UIView *panelView;

@property (weak, nonatomic) IBOutlet UIButton *searchBtn;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

@end

@implementation MWHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSArray *imagesURLStrings = @[[UIImage imageNamed:@"login_bg_01"],[UIImage imageNamed:@"login_bg_02"],[UIImage imageNamed:@"login_bg_03"]];
    
//    SDCycleScrollView *sdCycleScrollView = [[SDCycleScrollView alloc] initWithFrame:self.bannerView.bounds];
    
    self.bannerView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    self.bannerView.delegate = self;
    self.bannerView.autoScrollTimeInterval = 4.0f;
    self.bannerView.localizationImagesGroup = imagesURLStrings;
    
    UIImage *image = [UIImage imageNamed:@"attention"];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 50, 25);
    [btn addTarget:self action:@selector(showAttention:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = rightItem;
    [self.searchBtn addTarget:self action:@selector(goSearch:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)goSearch:(id)sender {
    NSString *keyword = self.searchTextField.text;
    if (keyword.length == 0) {
        [SVProgressHUD showInfoWithStatus:@"请输入要搜索的关键字"];
        return;
    }
    [self.view endEditing:YES];
    MWSearchResultTableViewController *search = [[MWSearchResultTableViewController alloc] init];
    search.keyword = keyword;
    [self.navigationController pushViewController:search animated:YES];
}
- (void)showAttention:(id)sender {
    NSArray *arr =  [MWLocalStorage allAttentions];
    
    if (arr.count == 0) {
        [SVProgressHUD showInfoWithStatus:@"暂无关注"];
        return;
    }
    MWLaboratoryListViewController *list = [[MWLaboratoryListViewController alloc] init];
    list.dataArray = arr;
    [self.navigationController pushViewController:list animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)GLJDSearchAction:(UIButton *)sender {
    
    MWGLJDViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MWGLJDViewController"];

    if (sender.tag == 1001) {
        vc.type = MWGLSearchTypeJD;
    }else if(sender.tag == 1002){
        vc.type = MWGLSearchTypeCD;
    }
    [self.navigationController pushViewController:vc animated:YES];
    
}

// SDCycleScrollView delegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
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
