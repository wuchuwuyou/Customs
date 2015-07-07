//
//  MWGLJDViewController.m
//  Customs
//
//  Created by Tiny on 15/7/6.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWGLJDViewController.h"
#import "MWGLJDTableViewController.h"
#import "MWGLJDViewModel.h"
@interface MWGLJDViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *bgScrollView;
@property (weak, nonatomic) IBOutlet MWInputView *codeInputView;
@property (weak, nonatomic) IBOutlet MWInputView *nameInputView;
@property (weak, nonatomic) IBOutlet MWInputView *tariffNoInputView;
@property (weak, nonatomic) IBOutlet MWInputView *specificationsInputView;
@property (weak, nonatomic) IBOutlet MWInputView *engNameInputView;
@property (weak, nonatomic) IBOutlet MWInputView *otherNameInputView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollBottomHeight;
@property (weak, nonatomic) IBOutlet MWInputViewButton *searchButton;
@property (weak, nonatomic) IBOutlet MWInputViewButton *resetButton;
@property (strong, nonatomic) NSMutableArray * inputViewArray;
@property (strong, nonatomic) MWGLJDViewModel *viewModel;
@end

@implementation MWGLJDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //    self.inputCode.text = @"相关编号";
    //    self.inputCode.isShow = YES;
    
    
    [self initViews];
    
    self.viewModel = [[MWGLJDViewModel alloc] initWithInputViewArray:self.inputViewArray];
    
    [self.resetButton setTitle:NSLocalizedString(@"reset", @"重置") forState:UIControlStateNormal];
    [self.searchButton setTitle:NSLocalizedString(@"search", @"查询") forState:UIControlStateNormal];
    
    /// 监听键盘事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
- (void)initViews{
    self.inputViewArray = [NSMutableArray array];
    
    [self.codeInputView titleText:NSLocalizedString(@"correlation_number", @"相关编号")];
    [self.nameInputView titleText:NSLocalizedString(@"goods_name_1", nil)];
    [self.tariffNoInputView titleText:NSLocalizedString(@"tariff_decision", nil)];
    [self.specificationsInputView titleText:NSLocalizedString(@"specification_model", nil)];
    [self.engNameInputView titleText:NSLocalizedString(@"eng_name", nil)];
    [self.otherNameInputView titleText:NSLocalizedString(@"other_name", nil)];
    [self.inputViewArray addObject:self.codeInputView];
    [self.inputViewArray addObject:self.nameInputView];
    [self.inputViewArray addObject:self.tariffNoInputView];
    [self.inputViewArray addObject:self.specificationsInputView];
    [self.inputViewArray addObject:self.engNameInputView];
    [self.inputViewArray addObject:self.otherNameInputView];

}
- (IBAction)resetAll:(id)sender {
    
    for (MWInputView *v in self.inputViewArray) {
        [v clearContent];
    }
}
- (IBAction)query:(id)sender {
    [self.view endEditing:YES];
    //    for (MWInputView *v in self.inputViewArray) {
    //        NSLog(@"%@",v.inputText);
    //    }
    NSLog(@"%@",[self.viewModel.reqModel toDictionary]);
    MWGLJDTableViewController *tbVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MWGLJDTableViewController"];
    tbVC.viewModel = self.viewModel;
    [self.navigationController pushViewController:tbVC animated:YES];
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
        self.scrollBottomHeight.constant = kbSize.height + 20;
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
        self.scrollBottomHeight.constant = 20;
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
