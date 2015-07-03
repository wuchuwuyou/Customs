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

@property (nonatomic ,strong) NSString *subTitle;
@property (nonatomic ,strong) NSString *keyword;

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
    self.subTitle = sb;
    self.keyword = k;
}
- (RACSignal *)queryTCIN{
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    [data setValue:self.subTitle forKey:@"tariffNo"];
    [data setValue:self.keyword forKey:@"keyWord"];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:[data getJSONString] forKey:@"jsonParams"];
    [params setValue:@"CLS00004" forKey:@"messageCode"];
    [params setValue:@(self.page_index) forKey:@"pageNo"];
    [params setValue:@(self.page_size) forKey:@"pageSize"];
    
    return [[MWAPIManager sharedManager] requestWithPath:[MWAPIHelper goodsTariffItemURL] andParameters:params];
}
- (NSArray *)modelArrayWithArray:(NSArray *)arr{
    return [MWTCINListDateModel arrayOfModelsFromDictionaries:arr];
}
@end