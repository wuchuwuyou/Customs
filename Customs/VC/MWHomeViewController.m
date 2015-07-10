//
//  MWHomeViewController.m
//  Customs
//
//  Created by Tiny on 15/6/11.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWHomeViewController.h"
#import "MWGLJDViewController.h"
@interface MWHomeViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *panelViewHeight;

@property (weak, nonatomic) IBOutlet UIImageView *bannerView;
@property (weak, nonatomic) IBOutlet UIView *panelView;

@end

@implementation MWHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *btn ;


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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
