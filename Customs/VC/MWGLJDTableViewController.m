//
//  MWGLJDTableViewController.m
//  Customs
//
//  Created by Tiny on 15/7/7.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWGLJDTableViewController.h"
#import "MW2TableViewCell.h"
#import "MW2TableViewHeaderView.h"
#import "MWGLJDListModel.h"
#import "MWGLJDDetailViewController.h"
#import "MWCommonDataHelper.h"
@interface MWGLJDTableViewController ()
@property (nonatomic,strong)  MW2TableViewHeaderView *headerView;


@end

@implementation MWGLJDTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.headerView = [[[NSBundle mainBundle] loadNibNamed:@"MW2TableViewHeaderView" owner:nil options:nil] lastObject];
    
    self.tableView.tableHeaderView = self.headerView;
    
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
    }];
    
    [self.headerView setLeftTitle:NSLocalizedString(@"issue_number", @"签发编号") right:NSLocalizedString(@"goods_name_1",@"商品名称")];
    [self.tableView.header beginRefreshing];
    
}

- (void)loadData{
    
    @weakify(self);
    [[self.viewModel requestListData] subscribeNext:^(RACTuple *value) {
        @strongify(self);
        
        NSDictionary *dict = value.first;
        NSArray *array  = [dict objectForKey:@"CLS00002"];
        if (self.viewModel.page_index == 1) {
            self.viewModel.listArray = nil;
        }
        
        NSMutableArray *arr = [NSMutableArray arrayWithArray: self.viewModel.listArray];
        [arr addObjectsFromArray:[self.viewModel modelArrayWithArray:array]];
        self.viewModel.listArray = arr;
        NSInteger count = [[[[dict objectForKey:@"CLS000021"] lastObject] objectForKey:@"rows"] integerValue];
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
    static NSString *CellIdentifier = @"listCell";
    
    MW2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MW2TableViewCell" owner:nil options:nil] lastObject];
    }
    
    MWGLJDListModel *m = self.viewModel.listArray[indexPath.row];
    
    [cell configCellWithLeftTitle:m.SOURCE_NO right:m.G_NAME];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *arr = [[MWCommonDataHelper sharedManager] GLJDListWithModel:self.viewModel.listArray[indexPath.row]];
    MWGLJDDetailViewController *dvc = [[MWGLJDDetailViewController alloc] init];
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
