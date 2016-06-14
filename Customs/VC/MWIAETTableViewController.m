//
//  MWIAETTableViewController.m
//  Customs
//
//  Created by Tiny on 15/6/23.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWIAETTableViewController.h"
#import "MWListCell.h"
#import "MWListHeaderView.h"
#import "MWTariffListViewModel.h"
#import "MWTariffListDataModel.h"
#import "MWCommonDataHelper.h"
#import "MWIAETDetailViewController.h"
#import "MWXMLParse.h"
#import "MWErrorAlert.h"
@interface MWIAETTableViewController ()
@property (nonatomic,strong)  MWListHeaderView *headerView;
@property (nonatomic,strong) MWTariffListViewModel *viewModel;
@end

@implementation MWIAETTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg"]];
//    [backgroundImage setFrame:self.view.frame];
//    [self.tableView.backgroundView addSubview:backgroundImage];
//    [self.tableView.backgroundView sendSubviewToBack:backgroundImage];

    self.headerView = [[[NSBundle mainBundle] loadNibNamed:@"MWListHeaderView" owner:nil options:nil] lastObject];
    
    self.tableView.tableHeaderView = self.headerView;
    
//    self.tableView.footer.hidden = YES;
    
    self.viewModel = [[MWTariffListViewModel alloc] initWithModel:self.model];
    @weakify(self);
    [self.tableView addLegendHeaderWithRefreshingBlock:^{
        @strongify(self);
        [self loadData];
    }];
    
    [self.tableView addLegendFooterWithRefreshingBlock:^{
        @strongify(self);
        if (!self.viewModel.canLoadMore) {
            [self endRefresh];
            [self.tableView.footer noticeNoMoreData];
            return ;
        }
        if (self.viewModel.listArray.count != 0) {
            self.viewModel.page_index++;
        }
        [self loadData];
    }];
    
    [RACObserve(self.viewModel, listArray) subscribeNext:^(NSArray *arr) {
        @strongify(self);
        
        [self.tableView reloadData];
    }];
    [RACObserve(self.viewModel, canLoadMore) subscribeNext:^(NSNumber *canLoadMore) {
        
        if (!canLoadMore.boolValue) {
            [self.tableView.footer noticeNoMoreData];
        }else{
            [self.tableView.footer resetNoMoreData];
        }
        
        if (self.viewModel.listArray.count == 0) {
            self.tableView.footer.hidden = YES;
        }else{
            self.tableView.footer.hidden = NO;
        }
    }];
    
    [self.headerView setLeftTitle:NSLocalizedString(@"tariff_no", nil) mid:NSLocalizedString(@"goods_name", nil) right:NSLocalizedString(@"general_tariff", nil)];
    
    [self.tableView.header beginRefreshing];
    
}

- (void)loadData{

    @weakify(self);
    [[self.viewModel queryMWTariff] subscribeNext:^(RACTuple *value) {
        @strongify(self);
        NSDictionary *dict = [MWXMLParse dictForXMLData:value.first];
//        NSDictionary *dict = value.first;
        if ([MWErrorAlert hasErrorMessageWithDict:dict]) {
            [self endRefresh];
            BOOL res =  self.viewModel.page_index == 1? :self.viewModel.page_index--;

            return ;
        }
        NSArray *array  = [dict objectForKey:@"CLS00003"];
        if (self.viewModel.page_index == 1) {
            self.viewModel.listArray = nil;
        }
        
        NSMutableArray *arr = [NSMutableArray arrayWithArray: self.viewModel.listArray];
        [arr addObjectsFromArray:[self.viewModel modelArrayWithArray:array]];
        self.viewModel.listArray = arr;
        NSInteger count = [[[[dict objectForKey:@"CLS000031"] lastObject] objectForKey:@"rows"] integerValue];
        self.viewModel.canLoadMore = self.viewModel.listArray.count<count?YES:NO;
        
        [self endRefresh];
    } error:^(NSError *error) {
        @strongify(self);

        [self performSelectorOnMainThread:@selector(showError:) withObject:error waitUntilDone:YES];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewModel.listArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"listCell";
    
    MWListCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MWListCell" owner:nil options:nil] lastObject];
    }
    
    MWTariffListDataModel *m = self.viewModel.listArray[indexPath.row];
    
    [cell configCellWithLeft:m.CODE_TS mid:m.G_NAME right:m.COMM_RATE];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   NSArray *arr = [[MWCommonDataHelper sharedManager] tariffListWithModel:self.viewModel.listArray[indexPath.row]];
    MWIAETDetailViewController *dvc = [[MWIAETDetailViewController alloc] init];
    dvc.dataArray = arr;
    [self.navigationController pushViewController:dvc animated:YES];
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
