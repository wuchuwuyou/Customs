//
//  MWNATSubViewModel.m
//  Customs
//
//  Created by Tiny on 15/7/3.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWNATSubViewModel.h"

@interface MWNATSubViewModel ()

@property (nonatomic ,strong) NSString *nat;
@property (nonatomic ,strong) NSString *sub;

@end
@implementation MWNATSubViewModel
- (instancetype)init{
    if (self = [super init]) {
        self.page_index = 1;
        self.page_size = PAGESIZE;
    }
    return self;
}
- (void)national:(NSString *)na subTitle:(NSString *)sub{
    self.nat = na;
    self.sub = sub;
}

- (RACSignal *)queryNATSub{
#warning TODO requeset  params
    /*
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    [data setValue:self.subTitle forKey:@"tariffNo"];
    [data setValue:self.keyword forKey:@"keyWord"];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:[data getJSONString] forKey:@"jsonParams"];
    [params setValue:@"CLS00004" forKey:@"messageCode"];
    [params setValue:@(self.page_index) forKey:@"pageNo"];
    [params setValue:@(self.page_size) forKey:@"pageSize"];
    
    return [[MWAPIManager sharedManager] requestWithPath:[MWAPIHelper goodsTariffItemURL] andParameters:params];
     */
    return nil;
}
- (NSArray *)modelArrayWithArray:(NSArray *)arr{
//    return [MWTCINListDateModel arrayOfModelsFromDictionaries:arr];
    return nil;
#warning TODO  create model!!!!
    
}

@end
