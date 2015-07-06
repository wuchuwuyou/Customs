//
//  MWNATSubViewModel.m
//  Customs
//
//  Created by Tiny on 15/7/3.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWNATSubViewModel.h"
#import "MWNATSubModel.h"
@interface MWNATSubViewModel ()

@property (nonatomic ,strong) NSString *nat;
@property (nonatomic ,strong) NSString *sub;

@end
@implementation MWNATSubViewModel
- (instancetype)init{
    if (self = [super init]) {
        self.page_index = 1;
        self.page_size = 10;
    }
    return self;
}
- (void)national:(NSString *)na subTitle:(NSString *)sub{
    self.nat = na;
    self.sub = sub;
}

- (RACSignal *)queryNATSub{
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    [data setValue:self.nat forKey:@"codeArticle"];
    [data setValue:self.sub forKey:@"codeTS"];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:[data getJSONString] forKey:@"jsonParams"];
    [params setValue:@"CLS00005" forKey:@"messageCode"];
    [params setValue:@(self.page_index) forKey:@"pageNo"];
    [params setValue:@(self.page_size) forKey:@"pageSize"];
    
    return [[MWAPIManager sharedManager] requestWithPath:[MWAPIHelper nativeSubItemURL] andParameters:params];
    
}
- (NSArray *)modelArrayWithArray:(NSArray *)arr{
    return [MWNATSubModel arrayOfModelsFromDictionaries:arr];
}

@end
