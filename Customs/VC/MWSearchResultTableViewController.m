//
//  MWSearchResultTableViewController.m
//  Customs
//
//  Created by Murphy on 16/6/7.
//  Copyright © 2016年 Murphy. All rights reserved.
//

#import "MWSearchResultTableViewController.h"
#import "MWSearchViewModel.h"
#import "MWXMLParse.h"
#import "MWSearchResultModel.h"
#import "MWIAETTableViewController.h"
#import "MWTCINTableViewController.h"
#import "MWNATSubTableViewController.h"
#import "MWKCTableViewController.h"
#import "MWGLJDTableViewController.h"
#import "MWTCINClassViewModel.h"
#import "MWTCINClassViewController.h"
#import "MWTCINSearchViewController.h"
#import "MWErrorAlert.h"
@interface MWSearchResultTableViewController ()
@property (nonatomic,strong) MWSearchViewModel *searchViewModel;
@end

@implementation MWSearchResultTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.title = @"查询结果";
    @weakify(self)
    [RACObserve(self, keyword) subscribeNext:^(NSString * kw) {
        @strongify(self)
        self.searchViewModel = ({
            MWSearchViewModel *search = [[MWSearchViewModel alloc] initWithKeywords:kw];
            search;
        });
    }];
    [RACObserve(self.searchViewModel, listArray) subscribeNext:^(id x) {
        [self.tableView reloadData];
    }];
    [self reqSearch];
    self.tableView.tableFooterView = [UIView new];
}
- (void)reqSearch {
    @weakify(self)
    [SVProgressHUD show];
    [[self.searchViewModel requestSearchData] subscribeNext:^(RACTuple *value) {
        NSDictionary *dict = [MWXMLParse dictForXMLData:value.first];
        NSLog(@"%@",dict);
        if ([MWErrorAlert hasErrorMessageWithDict:dict]) {
            
            return ;
        }
        NSArray *array  = [dict objectForKey:@"ds"];
        
        [self.searchViewModel modelArrayFromDataArray:array];

        [SVProgressHUD dismiss];
    } error:^(NSError *error) {
        @strongify(self);
        [self performSelectorOnMainThread:@selector(showError:) withObject:error waitUntilDone:YES];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.searchViewModel.listArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.backgroundColor = [UIColor clearColor];
    }
    MWSearchResultModel *model = self.searchViewModel.listArray[indexPath.row];
    cell.textLabel.text = model.title;
    cell.detailTextLabel.text = model.showCount;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    // Configure the cell...
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.f;
}
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    return [NSString stringWithFormat:@"查询[%@]的结果如下:",self.searchViewModel.keywords];
//}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *label = [[UILabel alloc] init];
    label.text = [NSString stringWithFormat:@"查询[%@]的结果如下:",self.searchViewModel.keywords];
    label.backgroundColor = [UIColor clearColor];
    return label;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    /*
     1——归类决定
     3——归类裁定
     13——重点商品
     97——本国子目
     95——进出口税则
     96——税则品目注释
     */
    NSString *key = self.searchViewModel.keywords;
    MWSearchResultModel *model = self.searchViewModel.listArray[indexPath.row];
    NSInteger rs = model.Sort.integerValue;
//    id targetVC;
    switch (rs) {
        case 1:
        {
            MWGLJDTableViewController *tbVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MWGLJDTableViewController"];
            MWGLJDReqModel *model = [[MWGLJDReqModel alloc] init];
            model.gName = key;
            tbVC.viewModel = [[MWGLJDViewModel alloc] initWithModel:model];
            tbVC.type = MWGLSearchTypeJD;
            [self.navigationController pushViewController:tbVC animated:YES];
//            targetVC = tbVC;

        }
            break;
        case 3:
        {
            MWGLJDTableViewController *tbVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MWGLJDTableViewController"];
            MWGLJDReqModel *model = [[MWGLJDReqModel alloc] init];
            model.gName = key;
            tbVC.viewModel = [[MWGLJDViewModel alloc] initWithModel:model];
            tbVC.type = MWGLSearchTypeCD;
            [self.navigationController pushViewController:tbVC animated:YES];
//            targetVC = tbVC;

        }
            break;
        case 13:
        {
            MWKeyCommoditiesViewModel *vm = [[MWKeyCommoditiesViewModel alloc] init];
            [vm code:@"" name:key keyword:@""];
            MWKCTableViewController *kcvc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MWKCTableViewController"];
            kcvc.viewModel = vm;
            [self.navigationController pushViewController:kcvc animated: YES];
//            targetVC = kcvc;

        }
            break;
        case 97:
        {
            MWNATSubViewModel *vm = [[MWNATSubViewModel alloc] init];
            [vm national:nil subTitle:key];
            MWNATSubTableViewController  *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MWNATSubTableViewController"];
            vc.viewModel = vm;
            [self.navigationController pushViewController:vc animated: YES];
//            targetVC = vc;

        }
            
            break;
        case 95:
        {
            MWIAETTableViewController *tbvc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"IAETTableViewController"];
            MWTariffModel *m = [[MWTariffModel alloc] init];
            m.name = key;
            tbvc.model = m;
            [self.navigationController pushViewController:tbvc animated:YES];
//            targetVC  = tbvc;
        }
            break;
        case 96:
        {
            MWTCINViewModel *vm = [[MWTCINViewModel alloc] init];
            [vm subtitle:@"" keyword:@"" name:key];
            MWTCINSearchViewController  *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MWTCINSearchViewController"];
            vc.viewModel = vm;
            [self.navigationController pushViewController:vc animated: YES];
        }
            break;
        default:
            break;
    }
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
