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

- (void)subtitle:(NSString *)sb keyword:(NSString *)k{
    self.subTitle = sb;
    self.keyword = k;
}
- (RACSignal *)queryTCIN{
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    [data setValue:self.subTitle forKey:@"codeArticle"];
    [data setValue:self.keyword forKey:@"codeTS"];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:[data getJSONString] forKey:@"jsonParams"];
    [params setValue:@"CLS00005" forKey:@"messageCode"];
    [params setValue:@(self.page_index) forKey:@"pageNo"];
    [params setValue:@(self.page_size) forKey:@"pageSize"];
    
    return [[MWAPIManager sharedManager] requestWithPath:[MWAPIHelper tariffListURL] andParameters:params];
}
- (NSArray *)modelArrayWithArray:(NSArray *)arr{
    return [MWTCINListDateModel arrayOfModelsFromDictionaries:arr];
}
@end
