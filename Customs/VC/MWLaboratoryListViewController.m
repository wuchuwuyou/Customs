//
//  MWLaboratoryListViewController.m
//  Customs
//
//  Created by Murphy on 16/6/2.
//  Copyright © 2016年 Murphy. All rights reserved.
//

#import "MWLaboratoryListViewController.h"
#import "MWLocalStorage.h"
#import "MWLabTableViewController.h"
#import "MWLabViewModel.h"
#import "MWXMLParse.h"
#import "MWErrorAlert.h"
#import "MWLabModel.h"
#import "MWCommonDataHelper.h"
@interface MWLaboratoryListViewController ()

@end

@implementation MWLaboratoryListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    @weakify(self)
    [RACObserve(self, dataArray) subscribeNext:^(NSArray *arr) {
        @strongify(self);
        [self.tableView reloadData];
    }];
    self.title = @"我的关注";
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self loadAttentions];
}
- (void)loadAttentions{
    NSArray *arr =  [MWLocalStorage allAttentions];
    self.dataArray = arr;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return  1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.contentView.backgroundColor = [UIColor clearColor];
        cell.backgroundColor = [UIColor clearColor];

    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    MWLabTableViewController *lab = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MWLabTableViewController"];
    NSString *orderID = self.dataArray[indexPath.row];
//    [self.navigationController pushViewController:lab animated:YES];
    [self loadDataWithOrderID:orderID];
}
- (void)loadDataWithOrderID:(NSString *)oid {

    MWLabViewModel *vm = [[MWLabViewModel alloc] initWithOrderNo:oid];
    [SVProgressHUD show];
    @weakify(self);
    [[vm requestData] subscribeNext:^(RACTuple *value) {
        @strongify(self);
        
        
        
        NSDictionary *dict = [MWXMLParse dictForXMLData:value.first];
        if ([MWErrorAlert hasErrorMessageWithDict:dict]) {
            
            return ;
        }
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
            return;
        }
        MWLabTableViewController *lab = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MWLabTableViewController"];
        lab.orderID = oid;
        [self.navigationController pushViewController:lab animated:YES];
        
        lab.dataArray = [[MWCommonDataHelper sharedManager] labStatusWithModel:model];
        
        [SVProgressHUD dismiss];
    } error:^(NSError *error) {
        @strongify(self);
        [SVProgressHUD showErrorWithStatus:[error errorString]];
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
