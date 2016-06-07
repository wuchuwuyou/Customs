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
    
    NSArray * arr = [MWSearchResultModel arrayOfModelsFromDictionaries:array];
    self.listArray = arr;
}
@end
