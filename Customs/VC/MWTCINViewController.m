//
//  MWTCINViewController.m
//  Customs
//
//  Created by Tiny on 15/7/2.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWTCINViewController.h"
#import "MWInputView.h"
#import "MWInputViewButton.h"

#import "MWTCINTableViewController.h"
#import "MWTCINClassViewController.h"
#import "MWTCINChapterViewController.h"

//#import "MWTCINClassViewModel.h"
//#import "MWTCINChapterViewModel.h"

@interface MWTCINViewController ()

@property (weak, nonatomic) IBOutlet  UIScrollView *bgScrollView;
@property (weak ,nonatomic) IBOutlet MWInputView *subtitle;

@property (weak ,nonatomic) IBOutlet MWInputView *keyword;

@property (weak, nonatomic) IBOutlet MWInputViewButton *resetButton;
@property (weak, nonatomic) IBOutlet MWInputViewButton *searchButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollBottomHeight;

@property (nonatomic,strong) NSMutableArray *inputViewArray;

@end

@implementation MWTCINViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //    self.tariffViewModel = [[MWTariffViewModel alloc] initWithMWInputViewArray:self.inputViewArray];
    
    
    /// 监听键盘事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    [self initViews];
}
- (void)initViews{
    self.inputViewArray = [NSMutableArray array];
    
    [self.subtitle titleText:NSLocalizedString(@"tariff_item", @"税则子目")];
    [self.keyword titleText:NSLocalizedString(@"keywords", @"关键字")];
    [self.inputViewArray addObject:self.subtitle];
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
    NSString *title = self.subtitle.inputText;
    NSString *keyword = self.keyword.inputText;
    
    if ((keyword == nil || keyword.length == 0 )&& (title == nil || title.length == 0)) {
//                title = @"CA";
        MWTCINClassViewModel *vm = [[MWTCINClassViewModel alloc] init];
        [vm subtitle:nil keyword:nil];
        MWTCINClassViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MWTCINClassViewController"];
        vc.viewModel = vm;
        [self.navigationController pushViewController:vc animated: YES];
        
    }else {
        MWTCINClassViewModel *vm = [[MWTCINClassViewModel alloc] init];
        [vm subtitle:title keyword:keyword];
        MWTCINClassViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MWTCINClassViewController"];
        vc.viewModel = vm;
        [self.navigationController pushViewController:vc animated: YES];

    }
//    if ([title.lowercaseString isEqualToString:@"ca"] || [title.lowercaseString isEqualToString:@"ch"]) {
//        MWTCINClassViewModel *vm = [[MWTCINClassViewModel alloc] init];
//        [vm subtitle:nil keyword:nil];
//        MWTCINClassViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MWTCINClassViewController"];
//        vc.viewModel = vm;
//        [self.navigationController pushViewController:vc animated: YES];
//        return;
//    }
//    if ([title.lowercaseString hasPrefix:@"ca"]) {
//        MWTCINChapterViewModel *vm = [[MWTCINChapterViewModel alloc] init];
//        [vm subtitle:title keyword:keyword];
//        MWTCINChapterViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MWTCINChapterViewController"];
//        vc.viewModel = vm;
//        [self.navigationController pushViewController:vc animated: YES];
//    }else if ([title.lowercaseString hasPrefix:@"ch"]){
//        MWTCINViewModel *vm = [[MWTCINViewModel alloc] init];
//        [vm subtitle:title keyword:keyword];
//        MWTCINTableViewController  *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MWTCINTableViewController"];
//        vc.viewModel = vm;
//        [self.navigationController pushViewController:vc animated: YES];
//    }else if([self isPureNumandCharacters:title]){
//        MWTCINViewModel *vm = [[MWTCINViewModel alloc] init];
//        [vm subtitle:title keyword:keyword];
//        MWTCINTableViewController  *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MWTCINTableViewController"];
//        vc.viewModel = vm;
//        [self.navigationController pushViewController:vc animated: YES];
//    }else {
//        MWTCINClassViewModel *vm = [[MWTCINClassViewModel alloc] init];
//        [vm subtitle:title keyword:keyword];
//        MWTCINClassViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MWTCINClassViewController"];
//        vc.viewModel = vm;
//        [self.navigationController pushViewController:vc animated: YES];
//
//    }
    
    //    if ([title.lowercaseString hasPrefix:@"ca"]) {
    //        // 类
    //        MWTCINClassViewModel *vm = [[MWTCINClassViewModel alloc] init];
    //        [vm subtitle:title keyword:keyword];
    //        MWTCINClassViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MWTCINClassViewController"];
    //        vc.viewModel = vm;
    //        [self.navigationController pushViewController:vc animated: YES];
    //
    //    }else if ([title.lowercaseString hasPrefix:@"ch"]) {
    //        MWTCINChapterViewModel *vm = [[MWTCINChapterViewModel alloc] init];
    //        [vm subtitle:title keyword:keyword];
    //        MWTCINChapterViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MWTCINChapterViewController"];
    //        vc.viewModel = vm;
    //        [self.navigationController pushViewController:vc animated: YES];
    //    }else {
    //        MWTCINViewModel *vm = [[MWTCINViewModel alloc] init];
    //        [vm subtitle:title keyword:keyword];
    //        MWTCINTableViewController  *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MWTCINTableViewController"];
    //        vc.viewModel = vm;
    //        [self.navigationController pushViewController:vc animated: YES];
    //    }
    //    MWTCINViewModel *vm = [[MWTCINViewModel alloc] init];
    //    [vm subtitle:self.subtitle.inputText keyword:self.keyword.inputText];
    //    MWTCINTableViewController  *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MWTCINTableViewController"];
    //    vc.viewModel = vm;
    //    [self.navigationController pushViewController:vc animated: YES];
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
- (BOOL)isPureNumandCharacters:(NSString *)string
{
    if (string.length == 0) {
        return NO;
    }
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if(string.length > 0)
    {
        return NO;
    }
    return YES;
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
