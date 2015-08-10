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
@interface MWHomeViewController () <SDCycleScrollViewDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *panelViewHeight;

@property (weak, nonatomic) IBOutlet SDCycleScrollView *bannerView;
@property (weak, nonatomic) IBOutlet UIView *panelView;

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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
