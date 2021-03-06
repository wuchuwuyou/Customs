//
//  MWTariffListViewModel.m
//  Customs
//
//  Created by Tiny on 15/6/29.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWTariffListViewModel.h"
#import "MWAPIManager.h"
#import "MWTariffListDataModel.h"
@interface MWTariffListViewModel ()
@property (nonatomic,strong) MWTariffModel *tModel;

@end

@implementation MWTariffListViewModel
@synthesize listArray = _listArray;
- (instancetype)initWithModel:(MWTariffModel *)model{
    
    if (self = [super init]) {
        self.tModel = model;
        self.page_index = 1;
        self.page_size = PAGESIZE;
        self.canLoadMore = YES;
    }
    return self;
}
- (RACSignal *)queryMWTariff{
/*
 /// <param name="messageCode">业务编号</param>
 /// <param name="jsonParams">查询条件字符串</param>
 /// <param name="orderType">排序方式</param>
 /// <param name="pageNo">当前页</param>
 /// <param name="pageSize">每页记录数</param>
 /// <returns> json格式字符串</returns>
 
 */
    NSMutableDictionary *data = [NSMutableDictionary dictionaryWithDictionary:[self.tModel toDictionary]];
    NSMutableDictionary *d = [NSMutableDictionary dictionary];
    [d setValue:data[@"codeTS"] forKey:@"codeTS"];
    [d setValue:data[@"gName"] forKey:@"gName"];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:[d getJSONString] forKey:@"jsonParams"];
    [params setValue:@"CLS00003" forKey:@"messageCode"];
    [params setValue:@(self.page_index) forKey:@"pageNo"];
    [params setValue:@(self.page_size) forKey:@"pageSize"];
    [params setValue:@"CODE_TS_S" forKey:@"orderType"];
    if (!self.searchType) {
        self.searchType = @(0);
    }
    [params setValue:self.searchType forKey:@"searchType"];

    return [[MWAPIManager sharedManager] requestWithPath:[MWAPIHelper tariffListURL] andParameters:params];
}
- (NSArray *)listArray{
    if (!_listArray) {
        _listArray = [NSArray array];
    }
    return _listArray;
}


- (NSArray *)modelArrayWithArray:(NSArray *)arr{
    NSError *error;
    NSArray*array = [MWTariffListDataModel arrayOfModelsFromDictionaries:arr error:&error];
    NSLog(@"%@",error);
    return array;
}

@end
