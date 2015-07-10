//
//  MWTCINTableViewController.m
//  Customs
//
//  Created by Tiny on 15/7/2.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWTCINTableViewController.h"
#import "MWListHeaderView.h"
#import "MWListCell.h"
#import "MWTCINListDateModel.h"
#import "MWTCINDetailViewController.h"

#import "MWTCINTabBarViewController.h"

@interface MWTCINTableViewController ()
@property (nonatomic,strong)  MWListHeaderView *headerView;

@end

@implementation MWTCINTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    @weakify(self);
    self.headerView = [[[NSBundle mainBundle] loadNibNamed:@"MWListHeaderView" owner:nil options:nil] lastObject];
    
    self.tableView.tableHeaderView = self.headerView;
    
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
    
    [self.headerView setLeftTitle:NSLocalizedString(@"chapter", nil) mid:NSLocalizedString(@"tariff_item", nil) right:NSLocalizedString(@"sub_clause", nil)];
    
    [self.tableView.header beginRefreshing];
    
    
}
- (void)loadData{
   
    @weakify(self);
    [[self.viewModel queryTCIN] subscribeNext:^(RACTuple *value) {
        @strongify(self);
        
        NSDictionary *dict = value.first;
        NSArray *array  = [dict objectForKey:@"CLS00004"];
        
        if (self.viewModel.page_index == 1) {
            self.viewModel.listArray = nil;
        }
        
        NSMutableArray *arr = [NSMutableArray arrayWithArray: self.viewModel.listArray];
        [arr addObjectsFromArray:[self.viewModel modelArrayWithArray:array]];
        self.viewModel.listArray = arr;
        NSInteger count = [[[[dict objectForKey:@"CLS000041"] lastObject] objectForKey:@"rows"] integerValue];
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
#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"listCell";
    
    MWListCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MWListCell" owner:nil options:nil] lastObject];
    }
    
    MWTCINListDateModel *model =  self.viewModel.listArray[indexPath.row];
    [cell configCellWithLeft:model.CHAPTER_NO mid:model.TARIFF_NO right:model.TARIFF_NAME];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.f;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    MWTCINDetailViewController *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"MWTCINDetailViewController"];
    MWTCINListDateModel *model =  self.viewModel.listArray[indexPath.row];
//    detail.tariffNo = model.TARIFF_NO;
//    [self.navigationController pushViewController:detail animated:YES];
    
    [self loadDetailDataWithModel:model];
    
    
}

- (void)loadDetailDataWithModel:(MWTCINListDateModel *)model{
    
    [SVProgressHUD show];
    
    [[MWTCINViewModel loadDetailData:model.TARIFF_NO] subscribeNext:^(RACTuple *value) {
        NSArray *arr  = value.first;
        NSDictionary *dict = [arr lastObject];
        NSError *error;
        MWTCINDetailDataModel *detailModel = [[MWTCINDetailDataModel alloc] initWithDictionary:dict error:&error];
        if (error) {
            NSLog(@"解析错误%@",[error errorString]);
            [SVProgressHUD showErrorWithStatus:[error errorString]];
        }else
        {
            MWTCINTabBarViewController *vc = [[MWTCINTabBarViewController alloc] init];
            vc.model = detailModel;
            [self.navigationController pushViewController:vc animated:YES];
            [SVProgressHUD dismiss];
        }
        
    } error:^(NSError *error) {
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
