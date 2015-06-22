//
//  MWIAETViewController.m
//  Customs
//
//  Created by Tiny on 15/6/11.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWIAETViewController.h"
#import "MWInputView.h"
#import "MWInputViewButton.h"
@interface MWIAETViewController ()

@property (nonatomic,weak) IBOutlet MWInputView *inputCode;

@property (weak, nonatomic) IBOutlet MWInputView *inputName;

@property (weak ,nonatomic) IBOutlet MWInputView *inputZHGSL1;

@property (weak ,nonatomic) IBOutlet MWInputView *inputZHGSL2;

@property (weak ,nonatomic) IBOutlet MWInputView *inputPTSL1;

@property (weak ,nonatomic) IBOutlet MWInputView *inputPTSL2;

@property (weak ,nonatomic) IBOutlet MWInputView *inputXDSLDM1;

@property (weak ,nonatomic) IBOutlet MWInputView *inputXDSLDM2;

@property (weak ,nonatomic) IBOutlet MWInputView *inputXDSLXG1;

@property (weak ,nonatomic) IBOutlet MWInputView *inputXDSLXG2;

@property (weak ,nonatomic) IBOutlet MWInputView *inputXDSLAM1;

@property (weak ,nonatomic) IBOutlet MWInputView *inputXDSLAM2;

@property (weak ,nonatomic) IBOutlet MWInputView *inputCKSL1;

@property (weak ,nonatomic) IBOutlet MWInputView *inputCKSL2;

@property (weak, nonatomic) IBOutlet MWInputViewButton *resetButton;
@property (weak, nonatomic) IBOutlet MWInputViewButton *searchButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollBottomHeight;

@property (nonatomic,strong) NSMutableArray *inputViewArray;

@end

@implementation MWIAETViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.inputCode.text = @"相关编号";
//    self.inputCode.isShow = YES;
    

    [self initViews];

    [self.resetButton setTitle:NSLocalizedString(@"reset", @"重置") forState:UIControlStateNormal];
    [self.searchButton setTitle:NSLocalizedString(@"search", @"查询") forState:UIControlStateNormal];
    
/// 监听键盘事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
- (void)initViews{
    self.inputViewArray = [NSMutableArray array];

    [self.inputCode titleText:@"税则列号"];
    [self.inputName titleText:@"货品名称"];
    [self.inputViewArray addObject:self.inputCode];
    [self.inputViewArray addObject:self.inputName];

    [self.inputZHGSL1 titleText:NSLocalizedString(@"MFN_tariff", @"最惠国税率")];
    [self.inputZHGSL2 titleText:@""];
    [self.inputViewArray addObject:self.inputZHGSL1];
    [self.inputViewArray addObject:self.inputZHGSL2];

    [self.inputPTSL1 titleText:NSLocalizedString(@"general_tariff", @"普通税率")];
    [self.inputPTSL2 titleText:@""];
    [self.inputViewArray addObject:self.inputPTSL1];
    [self.inputViewArray addObject:self.inputPTSL2];


    [self.inputXDSLDM1 titleText:NSLocalizedString(@"conventional_tariff_ASEAN", @"协定税率(东盟)")];
    [self.inputXDSLDM2 titleText:@""];

    [self.inputViewArray addObject:self.inputXDSLDM1];
    [self.inputViewArray addObject:self.inputXDSLDM2];

    [self.inputXDSLXG1 titleText:NSLocalizedString(@"conventional_tariff_HongKong", @"鞋底女税率(香港)")];
    [self.inputXDSLXG2 titleText:@""];
    
    
    [self.inputViewArray addObject:self.inputXDSLXG1];
    [self.inputViewArray addObject:self.inputXDSLXG2];

    [self.inputXDSLAM1 titleText:NSLocalizedString(@"conventional_tariff_Macao", @"协定税率(澳门)")];
    [self.inputXDSLAM2 titleText:@""];

    
    [self.inputViewArray addObject:self.inputXDSLAM1];
    [self.inputViewArray addObject:self.inputXDSLAM2];

    
    [self.inputCKSL1 titleText:NSLocalizedString(@"export_tariff", @"出口税率")];
    [self.inputCKSL2 titleText:@""];

    
    [self.inputViewArray addObject:self.inputCKSL1];
    [self.inputViewArray addObject:self.inputCKSL2];


}
- (IBAction)resetAll:(id)sender {
    
    for (MWInputView *v in self.inputViewArray) {
        [v clearContent];
    }
}
- (IBAction)query:(id)sender {
    [self.view endEditing:YES];
    for (MWInputView *v  in self.inputViewArray) {
        NSLog(@"%@::::%@",v,v.inputText);
    }
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
