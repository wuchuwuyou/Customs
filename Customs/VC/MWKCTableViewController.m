//
//  MWKCTableViewController.m
//  Customs
//
//  Created by Tiny on 15/7/3.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWKCTableViewController.h"
#import "MWListHeaderView.h"
#import "MWListCell.h"
#import "MWKeyCommoditiesModel.h"
#import "MWKCDetailTableViewController.h"
#import "MWCommonDataHelper.h"
@interface MWKCTableViewController ()
@property (nonatomic,strong)  MWListHeaderView *headerView;

@end

@implementation MWKCTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.headerView = [[[NSBundle mainBundle] loadNibNamed:@"MWListHeaderView" owner:nil options:nil] lastObject];
    
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
        
        if (self.viewModel.listArray.count == 0) {
            self.tableView.footer.hidden = YES;
        }else{
            self.tableView.footer.hidden = NO;
        }
        
    }];
    
    [self.headerView setLeftTitle:NSLocalizedString(@"goods_name_1", nil) mid:NSLocalizedString(@"goods_no", nil) right:NSLocalizedString(@"specification_model", nil)];
    
    [self.tableView.header beginRefreshing];

}
- (void)loadData{
    
    @weakify(self);
    [[self.viewModel queryKC] subscribeNext:^(RACTuple *value) {
        @strongify(self);
        
        NSDictionary *dict = value.first;
        NSArray *array  = [dict objectForKey:@"CLS00006"];
        if (self.viewModel.page_index == 1) {
            self.viewModel.listArray = nil;
        }
        NSMutableArray *arr = [NSMutableArray arrayWithArray: self.viewModel.listArray];
        [arr addObjectsFromArray:[self.viewModel modelArrayWithArray:array]];
        self.viewModel.listArray = arr;
        NSInteger count = [[[[dict objectForKey:@"CLS000061"] lastObject] objectForKey:@"rows"] integerValue];
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
    
    MWKeyCommoditiesModel *m = self.viewModel.listArray[indexPath.row];
    
    [cell configCellWithLeft:m.CODE_TS mid:m.G_NAME right:m.G_MODEL];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *arr = [[MWCommonDataHelper sharedManager] keyCommoditiesListWithModel:self.viewModel.listArray[indexPath.row]];
    MWKCDetailTableViewController *dvc = [[MWKCDetailTableViewController alloc] init];
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
