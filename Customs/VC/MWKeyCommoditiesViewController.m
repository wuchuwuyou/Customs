//
//  MWKeyCommoditiesViewController.m
//  Customs
//
//  Created by Tiny on 15/7/3.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWKeyCommoditiesViewController.h"
#import "MWKeyCommoditiesViewModel.h"
#import "MWKCTableViewController.h"
@interface MWKeyCommoditiesViewController ()
@property (weak, nonatomic) IBOutlet  UIScrollView *bgScrollView;
@property (weak ,nonatomic) IBOutlet MWInputView *code;
@property (weak ,nonatomic) IBOutlet MWInputView *name;

@property (weak ,nonatomic) IBOutlet MWInputView *keyword;

@property (weak, nonatomic) IBOutlet MWInputViewButton *resetButton;
@property (weak, nonatomic) IBOutlet MWInputViewButton *searchButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollBottomHeight;

@property (nonatomic,strong) NSMutableArray *inputViewArray;

@end

@implementation MWKeyCommoditiesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
    /// 监听键盘事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)initViews{
    self.inputViewArray = [NSMutableArray array];
    
    [self.code titleText:NSLocalizedString(@"goods_no", @"商品编号")];
    [self.name titleText:NSLocalizedString(@"goods_name_1", @"商品名称")];
    [self.keyword titleText:NSLocalizedString(@"keywords", @"关键字")];
    
    [self.inputViewArray addObject:self.code];
    [self.inputViewArray addObject:self.name];
    [self.inputViewArray addObject:self.keyword];
    
    
    [self.resetButton setTitle:NSLocalizedString(@"reset", @"重置") forState:UIControlStateNormal];
    [self.searchButton setTitle:NSLocalizedString(@"search", @"查询") forState:UIControlStateNormal];
    
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
    MWKeyCommoditiesViewModel *vm = [[MWKeyCommoditiesViewModel alloc] init];
    [vm code:self.code.inputText name:self.name.inputText keyword:self.keyword.inputText];
    MWKCTableViewController *kcvc = [self.storyboard instantiateViewControllerWithIdentifier:@"MWKCTableViewController"];
    kcvc.viewModel = vm;
    [self.navigationController pushViewController:kcvc animated: YES];
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
