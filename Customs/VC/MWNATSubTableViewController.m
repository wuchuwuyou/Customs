//
//  MWNATSubTableViewController.m
//  Customs
//
//  Created by Tiny on 15/7/6.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWNATSubTableViewController.h"
#import "MW2TableViewCell.h"
#import "MW2TableViewHeaderView.h"
#import "MWNATSubModel.h"
#import "MWNATSubTabBarController.h"
@interface MWNATSubTableViewController ()
@property (nonatomic,strong)  MW2TableViewHeaderView *headerView;

@end

@implementation MWNATSubTableViewController

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
        
        if (self.viewModel.listArray.count == 0) {
            self.tableView.footer.hidden = YES;
        }else{
            self.tableView.footer.hidden = NO;
        }
        
    }];
    
//    [self.headerView setLeftTitle:NSLocalizedString(@"goods_name_1", nil) mid:NSLocalizedString(@"goods_no", nil) right:NSLocalizedString(@"specification_model", nil)];
    [self.headerView setLeftTitle:NSLocalizedString(@"national_subheadings", @"本国子目") right:NSLocalizedString(@"sub_clause",@"子目条文")];
    
    [self.tableView.header beginRefreshing];
    
}
- (void)loadData{
    
    @weakify(self);
    [[self.viewModel queryNATSub] subscribeNext:^(RACTuple *value) {
        @strongify(self);
        
        NSDictionary *dict = value.first;
        NSArray *array  = [dict objectForKey:@"CLS00005"];
        if (self.viewModel.page_index == 1) {
            self.viewModel.listArray = nil;
        }
        NSMutableArray *arr = [NSMutableArray arrayWithArray: self.viewModel.listArray];
        [arr addObjectsFromArray:[self.viewModel modelArrayWithArray:array]];
        self.viewModel.listArray = arr;
        NSInteger count = [[[[dict objectForKey:@"CLS000051"] lastObject] objectForKey:@"rows"] integerValue];
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
    static NSString *CellIdentifier = @"MW2TableViewCell";
    
    MW2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MW2TableViewCell" owner:nil options:nil] lastObject];
    }
    
    MWNATSubModel *m = self.viewModel.listArray[indexPath.row];
    
    [cell configCellWithLeftTitle:m.CODE_TS right:m.ARTICLE];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MWNATSubModel *model = self.viewModel.listArray[indexPath.row];
    
    MWNATSubTabBarController * tab = [[MWNATSubTabBarController alloc] init];
    tab.model = model;
    [self.navigationController pushViewController:tab animated:YES];
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
