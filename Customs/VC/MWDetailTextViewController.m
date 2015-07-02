//
//  MWDetailTextViewController.m
//  Customs
//
//  Created by Tiny on 15/7/1.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWDetailTextViewController.h"

@interface MWDetailTextViewController ()
@property (nonatomic,weak) IBOutlet UILabel *titleLabel;
@property (nonatomic,weak) IBOutlet UITextView *detailTextView;
@property (nonatomic,strong) NSString *titleText;
@property (nonatomic,strong) NSString *detailText;
@end

@implementation MWDetailTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [RACObserve(self, titleText) subscribeNext:^(NSString *value) {
        self.titleLabel.text = value;
    }];

    [RACObserve(self, detailText) subscribeNext:^(NSString *value) {
        self.detailTextView.text = value;
    }];
    
    self.detailTextView.editable = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)configViewWittTitle:(NSString *)title detailText:(NSString *)dt{
    self.titleText = title;
    self.detailText = dt;
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
