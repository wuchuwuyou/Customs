//
//  MWSMJGClassViewController.m
//  Customs
//
//  Created by Murphy on 16/8/18.
//  Copyright © 2016年 Murphy. All rights reserved.
//

#import "MWSMJGClassViewController.h"
#import "MWTCINClassViewController.h"
#import "MW2TableViewHeaderView.h"
#import "MWXMLParse.h"
#import "MWListCell.h"
#import "MWTCINListDateModel.h"
#import "MWTCINChapterViewModel.h"
#import "MWSMJGChapterViewController.h"
#import "MWErrorAlert.h"
#import "MWWebViewController.h"
@interface MWSMJGClassViewController ()
//@property (nonatomic,strong)  MW2TableViewHeaderView *headerView;

@end

@implementation MWSMJGClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    @weakify(self);
//    self.headerView = [[[NSBundle mainBundle] loadNibNamed:@"MW2TableViewHeaderView" owner:nil options:nil] lastObject];
    
//    self.tableView.tableHeaderView = self.headerView;
    self.navigationItem.title = @"税目结构";
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
    

    
    [self.tableView.header beginRefreshing];
    
}
- (void)loadData{
    
    @weakify(self);
    [[self.viewModel queryJG] subscribeNext:^(RACTuple *value) {
        @strongify(self);
        NSDictionary *dict = [MWXMLParse dictForXMLData:value.first];
        if ([MWErrorAlert hasErrorMessageWithDict:dict]) {
            [self endRefresh];
            BOOL res =  self.viewModel.page_index == 1? :self.viewModel.page_index--;
            
            return ;
        }
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
        [self performSelectorOnMainThread:@selector(showError:) withObject:error waitUntilDone:YES];
    }];

    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.viewModel.listArray == 0) {
        return 0;
    }
    return self.viewModel.listArray.count +1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"listCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
//        cell = [[[NSBundle mainBundle] loadNibNamed:@"MWListCell" owner:nil options:nil] lastObject];
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = @"税则归类总规则";
    }else {
        MWTCINListDateModel *model =  self.viewModel.listArray[indexPath.row-1];
        //    [cell configCellWithLeft:model.TARIFF_NAME mid:model.TARIFF_NO right:model.TARIFF_NAME];
        cell.textLabel.text = [NSString stringWithFormat:@"%@  %@",model.title,model.TARIFF_NAME];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.f;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        MWWebViewController *vc =  [[[NSBundle mainBundle] loadNibNamed:@"MWWebViewController" owner:nil options:nil] lastObject];
        vc.urlString = SZGLZGZURL;
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    //    MWTCINDetailViewController *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"MWTCINDetailViewController"];
    MWTCINListDateModel *model =  self.viewModel.listArray[indexPath.row-1];
    //    detail.tariffNo = model.TARIFF_NO;
    //    [self.navigationController pushViewController:detail animated:YES];
    
    //    [self loadDetailDataWithModel:model];
    
    MWTCINChapterViewModel *vm = [[MWTCINChapterViewModel alloc] init];
    [vm subtitle:model.TARIFF_NO keyword:nil];
    MWSMJGChapterViewController *vc = [[MWSMJGChapterViewController alloc] initWithStyle:UITableViewStylePlain];
    vc.viewModel = vm;
    [self.navigationController pushViewController:vc animated: YES];
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
