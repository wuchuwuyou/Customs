//
//  MWKCDetailTableViewController.m
//  Customs
//
//  Created by Tiny on 15/7/6.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWKCDetailTableViewController.h"
#import "MWDetailListTableViewCell.h"
#import "MWCommonModel.h"
@interface MWKCDetailTableViewController ()

@end

@implementation MWKCDetailTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.tableFooterView = [UIView new];
    self.title = NSLocalizedString(@"key_goods_result", @"重点商品查询结果");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"detailListCell";
    
    MWDetailListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MWDetailListTableViewCell" owner:self options:nil] lastObject];
    }
    
    
    MWCommonModel *model = self.dataArray[indexPath.row];
    
    CGSize size = cell.contentLabel_.frame.size;
    
    
    //    CGFloat realHeight = [model.content sizeWithFont:cell.contentLabel_.font forWidth:size.width lineBreakMode:cell.contentLabel_.lineBreakMode].height;
    CGSize realSize = Multline_TextSize(model.content, cell.contentLabel_.font, size, cell.contentLabel_.lineBreakMode);
    model.isMore = realSize.height>(size.height-16)?YES:NO;
    if (model.isMore) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        NSLog(@"%@",model);
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell configCellWithTitle:model.name content:model.content];
    
    return cell;
}



#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MWCommonModel *model = self.dataArray[indexPath.row];
    if (model.isMore) {
        MWDetailTextViewController *textVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MWDetailTextViewController"];
        textVC.title = NSLocalizedString(@"key_goods_result", @"重点商品查询结果");
        [textVC configViewWittTitle:model.name detailText:model.content];
        [self.navigationController pushViewController:textVC animated:YES];
        
    }
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
