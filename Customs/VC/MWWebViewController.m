//
//  MWWebViewController.m
//  Customs
//
//  Created by Tiny on 15/7/6.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWWebViewController.h"

@interface MWWebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *bgWebView;

@end

@implementation MWWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    @weakify(self);
    [RACObserve(self, content) subscribeNext:^(NSString *value) {
        @strongify(self);
        [self.bgWebView loadHTMLString:value baseURL:nil];
    }];
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
