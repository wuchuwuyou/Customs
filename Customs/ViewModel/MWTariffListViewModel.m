//
//  MWTariffListViewModel.m
//  Customs
//
//  Created by Tiny on 15/6/29.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWTariffListViewModel.h"
#import "MWAPIManager.h"
#import "MWListDataModel.h"
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
    
    
   
    NSMutableDictionary *data = [NSMutableDictionary dictionaryWithDictionary:[self.tModel toDictionary]];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:[data getJSONString] forKey:@"jsonParams"];
    [params setValue:@"CLS00003" forKey:@"messageCode"];
    [params setValue:@(self.page_index) forKey:@"pageNo"];
    [params setValue:@(self.page_size) forKey:@"pageSize"];
    
//    [AFHTTPSessionManager manager].responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
//
//    [[AFHTTPSessionManager manager] POST:[MWAPIHelper tariffListURL] parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
//        
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        
//    }];
    
    RACSignal *signal =  [[MWAPIManager sharedManager] requestWithPath:[MWAPIHelper tariffListURL] andParameters:params];
    return signal;
}
- (NSArray *)listArray{
    if (!_listArray) {
        _listArray = [NSArray array];
    }
    return _listArray;
}


- (NSArray *)modelArrayWithArray:(NSArray *)arr{
   return  [MWListDataModel arrayOfDictionariesFromModels:arr];
}

@end
