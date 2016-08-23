//
//  MWWebViewController.m
//  Customs
//
//  Created by Tiny on 15/7/6.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWWebViewController.h"
#import <SVProgressHUD.h>
@interface MWWebViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *bgWebView;

@end

@implementation MWWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.bgWebView.backgroundColor = [UIColor clearColor];
    @weakify(self);
    
    [RACObserve(self, content) subscribeNext:^(NSString *value) {
        @strongify(self);
        if (self.content) {
            [self.bgWebView loadHTMLString:value baseURL:nil];
        }
    }];
    
    [RACObserve(self, urlString) subscribeNext:^(NSString *x) {
        if (x) {
            [self.bgWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:x]]];
        }
    }];
    self.bgWebView.delegate = self;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [SVProgressHUD show];

}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [SVProgressHUD dismiss];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error {
    [SVProgressHUD showErrorWithStatus:[error errorString]];
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
