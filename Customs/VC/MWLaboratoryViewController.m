//
//  MWLaboratoryViewController.m
//  Customs
//
//  Created by Tiny on 15/7/8.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWLaboratoryViewController.h"
#import "MWLabViewModel.h"
#import "MWLabTableViewController.h"
#import "MWCommonDataHelper.h"
@interface MWLaboratoryViewController ()
@property (weak, nonatomic) IBOutlet MWInputView *orderNoInputView;
@property (weak, nonatomic) IBOutlet MWInputViewButton *resetBtn;
@property (weak, nonatomic) IBOutlet MWInputViewButton *searchBtn;
@property (weak, nonatomic) IBOutlet UIScrollView *bgScrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollBottomHeight;

@end

@implementation MWLaboratoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.title = NSLocalizedString(@"lab_state_search", @"化验状态查询") ;
    
    [self.orderNoInputView titleText:NSLocalizedString(@"lab_no", @"报关单号")];
    
    
    [self.resetBtn setTitle:NSLocalizedString(@"reset", @"重置") forState:UIControlStateNormal];
    [self.searchBtn setTitle:NSLocalizedString(@"search", @"查询") forState:UIControlStateNormal];
    
    /// 监听键盘事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (IBAction)resetAll:(id)sender {
    [self.orderNoInputView clearContent];
}
- (IBAction)query:(id)sender {
    [self.view endEditing:YES];
    //    for (MWInputView *v in self.inputViewArray) {
    //        NSLog(@"%@",v.inputText);
    //    }
    
    if (self.orderNoInputView.inputText.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"请输入要查询的报关单号!"];
        return;
    }

    MWLabViewModel *viewModel = [[MWLabViewModel alloc] initWithOrderNo:self.orderNoInputView.inputText];
    
    [SVProgressHUD show];
    @weakify(self);
    [[viewModel requestData] subscribeNext:^(RACTuple *value) {
        @strongify(self);
        
        NSDictionary *dict = value.first;
        NSDictionary *data  = [dict objectForKey:@"Labssisvlaue"];
        
        NSError *error = nil;
        
        NSInteger code = [[dict objectForKey:@"status"] integerValue];
        NSString *msg = [dict objectForKey:@"errormsg"];
        
        if (code != 0) {
            [SVProgressHUD showErrorWithStatus:msg];
            return ;
        }
        
        MWLabModel *model = [[MWLabModel alloc] initWithDictionary:data error:&error];
        
        if (error) {
            NSAssert(error, @"化验状态解析错误");
        }
        MWLabTableViewController *lab = [self.storyboard instantiateViewControllerWithIdentifier:@"MWLabTableViewController"];

        lab.dataArray = [[MWCommonDataHelper sharedManager] labStatusWithModel:model];
        [self.navigationController pushViewController:lab animated:YES];
        [SVProgressHUD dismiss];
    } error:^(NSError *error) {
        @strongify(self);
        [SVProgressHUD showErrorWithStatus:[error errorString]];
    }];


    
    
}

- (void)keyboardWillShow:(NSNotification *)aNotification{
    
    NSDictionary* info = [aNotification userInfo];
    
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    
    NSTimeInterval animationDuration;
    
    UIViewAnimationCurve animationCurve;
    
    [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    
    [[info objectForKey:UIKeyboardAnimationCurveUserInfoKey] getValue:&animationCurve];
    
    UIViewAnimationOptions options = animationCurve << 16;
    
    [UIView animateWithDuration:animationDuration delay:0.0f options:options animations:^ {
        self.scrollBottomHeight.constant = kbSize.height + 10;
        [self.view layoutIfNeeded];
    } completion:nil];
}
- (void)keyboardWillHide:(NSNotification *)aNotification{
    
    NSDictionary* info = [aNotification userInfo];
    
    //    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    
    NSTimeInterval animationDuration;
    
    UIViewAnimationCurve animationCurve;
    
    [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    
    [[info objectForKey:UIKeyboardAnimationCurveUserInfoKey] getValue:&animationCurve];
    
    UIViewAnimationOptions options = animationCurve << 16;
    
    [UIView animateWithDuration:animationDuration delay:0.0f options:options animations:^ {
        self.scrollBottomHeight.constant = 10;
        [self.view layoutIfNeeded];
    } completion:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
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
