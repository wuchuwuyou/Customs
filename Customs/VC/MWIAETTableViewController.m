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
@interface MWIAETTableViewController ()
@property (nonatomic,weak) IBOutlet MWListHeaderView *headerView;
@property (nonatomic,strong) MWTariffListViewModel *viewModel;
@end

@implementation MWIAETTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
        }
        self.viewModel.page_index++;
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
    }];
    
    [self.headerView setLeftTitle:NSLocalizedString(@"tariff_no", nil) mid:NSLocalizedString(@"goods_name", nil) right:NSLocalizedString(@"general_tariff", nil)];
    
    [self.tableView.header beginRefreshing];
    
}
- (void)loadData{

    @weakify(self);
    [[self.viewModel queryMWTariff] subscribeNext:^(RACTuple *value) {
        @strongify(self);
        
        NSDictionary *dict = value.first;
        NSArray *array  = [dict objectForKey:@"CLS00003"];
        
        NSMutableArray *arr = [NSMutableArray arrayWithArray: self.viewModel.listArray];
        [arr addObjectsFromArray:[self.viewModel modelArrayWithArray:array]];
        self.viewModel.listArray = arr;
        NSInteger count = [[[[dict objectForKey:@"CLS000031"] lastObject] objectForKey:@"rows"] integerValue];
        self.viewModel.canLoadMore = self.viewModel.listArray.count<count?YES:NO;
        [self endRefresh];
    } error:^(NSError *error) {
        @strongify(self);
        [self endRefresh];
        [SVProgressHUD showErrorWithStatus:[error errorString]];
    }];
}
- (void)endRefresh{
    [self.tableView.header endRefreshing];
    [self.tableView.footer endRefreshing];
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
    MWListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listCell"];
    
    MWTariffListDataModel *m = self.viewModel.listArray[indexPath.row];
    
    [cell configCellWithLeft:m.CODE_TS mid:m.G_NAME right:m.COMM_RATE];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
