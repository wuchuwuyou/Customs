//
//  MWTCINViewModel.m
//  Customs
//
//  Created by Tiny on 15/7/2.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWTCINViewModel.h"
#import "MWTCINListDateModel.h"
@interface MWTCINViewModel ()

@end

@implementation MWTCINViewModel
- (instancetype)init{
    if (self = [super init]) {
        self.page_index = 1;
        self.page_size = PAGESIZE;
    }
    return self;
}
- (void)subtitle:(NSString *)sb keyword:(NSString *)k{
    _subTitle = sb;
    _name = k;
}
- (void)subtitle:(NSString *)sb keyword:(NSString *)k name:(NSString *)n {
    _subTitle = sb;
    _name = k;
    _name = n;
}
- (RACSignal *)queryTCIN{
    
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    [data setValue:self.subTitle forKey:@"tariffNo"];
    [data setValue:self.keyword forKey:@"keyWord"];
    [data setValue:self.name forKey:@"tariffName"];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:[data getJSONString] forKey:@"jsonParams"];
    [params setValue:@"CLS00004" forKey:@"messageCode"];
    [params setValue:@(self.page_index) forKey:@"pageNo"];
    [params setValue:@(self.page_size) forKey:@"pageSize"];
    [params setValue:@"TARIFF_NO" forKey:@"orderType"];

    return [[MWAPIManager sharedManager] requestWithPath:[MWAPIHelper goodsTariffItemURL] andParameters:params];
}
//getCHTraiffCommentary
- (RACSignal *)queryTCINCH{
    
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    [data setValue:self.subTitle forKey:@"tariffNo"];
    [data setValue:self.keyword forKey:@"keyWord"];
    [data setValue:self.name forKey:@"TARIFF_NAME"];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:[data getJSONString] forKey:@"jsonParams"];
    [params setValue:@"CLS00004" forKey:@"messageCode"];
    [params setValue:@(self.page_index) forKey:@"pageNo"];
    [params setValue:@(self.page_size) forKey:@"pageSize"];
    [params setValue:@"TARIFF_NO" forKey:@"orderType"];
    
    return [[MWAPIManager sharedManager] requestWithPath:[MWAPIHelper CHTraiffCommentaryURL] andParameters:params];
}
+ (RACSignal *)loadDetailData:(NSString *)tariffNo {
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    [data setValue:tariffNo forKey:@"tariffNo"];
    return [[MWAPIManager sharedManager] requestWithPath:[MWAPIHelper goodsDetailURL] andParameters:data];
}
- (NSArray *)modelArrayWithArray:(NSArray *)arr{
    NSError *error ;
    NSArray *array =  [MWTCINListDateModel arrayOfModelsFromDictionaries:arr error:&error];
    NSLog(@"%@",error);
    return array;
}
@end
