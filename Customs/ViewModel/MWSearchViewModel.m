//
//  MWSearchViewModel.m
//  Customs
//
//  Created by Murphy on 16/6/7.
//  Copyright © 2016年 Murphy. All rights reserved.
//

#import "MWSearchViewModel.h"

@implementation MWSearchViewModel
- (instancetype)initWithKeywords:(NSString *)keywords {
    if (self = [super init]) {
        _keywords = keywords;
    }
    return self;
}
- (RACSignal *)requestSearchData {
//    NSMutableDictionary *data = [NSMutableDictionary dictionary];
//    [data setValue:self.keywords forKey:@"keyWord"];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    [params setValue:[data getJSONString] forKey:@"jsonParams"];
    [params setValue:self.keywords forKey:@"jsonParams"];

    [params setValue:@"CLS00015" forKey:@"messageCode"];
    return [[MWAPIManager sharedManager] requestWithPath:[MWAPIHelper searchURL] andParameters:params];
}
- (void)modelArrayFromDataArray:(NSArray *)array {
    /*
     1——归类决定
     
     3——归类裁定
     
     13——重点商品
     
     97——本国子目
     
     95——进出口税则
     
     96——税则品目注释
     
     */
    
    NSArray *list = @[@"1",@"3",@"13",@"97",@"95",@"96"];

    NSMutableArray *result = [NSMutableArray array];
    [array enumerateObjectsUsingBlock:^(NSDictionary* _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *sort = obj[@"Sort"];
        if ([list containsObject:sort]) {
            [result addObject:obj];
        }
    }];
    NSArray * arr = [MWSearchResultModel arrayOfModelsFromDictionaries:result];

    self.listArray = arr;
}
@end
