//
//  MWTCINDetailViewController.m
//  Customs
//
//  Created by Tiny on 15/7/5.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWTCINDetailViewController.h"
#import "MWTCINViewModel.h"
#import "MWTCINListDateModel.h"
@interface MWTCINDetailViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *contentWebView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomViewHeight;

///类注
@property (weak, nonatomic) IBOutlet UIButton *classButton;
///章注
@property (weak, nonatomic) IBOutlet UIButton *chapterButton;
///品目注
@property (weak, nonatomic) IBOutlet UIButton *itemButton;

@property (nonatomic,strong) MWTCINDetailDataModel *model;


@property (nonatomic,assign) NSInteger flag;
@end

@implementation MWTCINDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [RACObserve(self, model) subscribeNext:^(id x) {
        if (x == nil) {
            self.bottomViewHeight.constant = 0;
            NSLog(@"error");
        }else{
            self.bottomViewHeight.constant = 49.0;
        }
    }];
    [self loadDetailData];
    [RACObserve(self, flag) subscribeNext:^(NSNumber *f) {
        NSLog(@"%zd",f.integerValue);
        
        switch (f.integerValue) {
            case 1:
                [self.contentWebView loadHTMLString:self.model.classAnnotation baseURL:nil];
                break;
            
            case 2:
                [self.contentWebView loadHTMLString:self.model.chapterAnnotation baseURL:nil];
                break;
                
            case 3:
                [self.contentWebView loadHTMLString:self.model.itemAnnotation baseURL:nil];

                break;
                
            default:
                break;
        }
    }];
}
- (void)loadDetailData{
    
    [SVProgressHUD show];
    
    [[MWTCINViewModel loadDetailData:self.tariffNo] subscribeNext:^(RACTuple *value) {
        NSArray *arr  = value.first;
        NSDictionary *dict = [arr lastObject];
        NSError *error;
        self.model = [[MWTCINDetailDataModel alloc] initWithDictionary:dict error:&error];
        [self classButtonAction:self.classButton];

        if (error) {
            NSLog(@"解析错误%@",[error errorString]);
            [SVProgressHUD showErrorWithStatus:[error errorString]];
        }else
            [SVProgressHUD dismiss];
        
    } error:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:[error errorString]];
    }];
}
- (IBAction)classButtonAction:(UIButton *)sender {
    self.flag = 1;
}
- (IBAction)chapterButtonAction:(UIButton *)sender {
    self.flag = 2;
}
- (IBAction)itemButtonAction:(UIButton *)sender {
    self.flag = 3;
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
