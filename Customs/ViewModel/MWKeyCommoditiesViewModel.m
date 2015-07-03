//
//  MWKeyCommoditiesViewModel.m
//  Customs
//
//  Created by Tiny on 15/7/3.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWKeyCommoditiesViewModel.h"
#import "MWKeyCommoditiesModel.h"

@interface MWKeyCommoditiesViewModel ()
@property (nonatomic ,strong) NSString *name;
@property (nonatomic ,strong) NSString *code;
@property (nonatomic ,strong) NSString *key;


@end

@implementation MWKeyCommoditiesViewModel
- (instancetype)init{
    if (self = [super init]) {
        self.page_index = 1;
        self.page_size = PAGESIZE;
    }
    return self;
}
- (void)code:(NSString *)code name:(NSString *)name keyword:(NSString *)key{
    self.name = name;
    self.code = code;
    self.key  = key;
}
- (RACSignal *)queryKC{
    
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    [data setValue:self.key forKey:@"keyWord"];
    [data setValue:self.name forKey:@"gName"];
    [data setValue:self.code forKey:@"codeTS"];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:[data getJSONString] forKey:@"jsonParams"];
    [params setValue:@"CLS00006" forKey:@"messageCode"];
    [params setValue:@(self.page_index) forKey:@"pageNo"];
    [params setValue:@(self.page_size) forKey:@"pageSize"];
    
    return [[MWAPIManager sharedManager] requestWithPath:[MWAPIHelper goodsKeyURL] andParameters:params];
    
}
- (NSArray *)modelArrayWithArray:(NSArray *)arr{
    return [MWKeyCommoditiesModel arrayOfModelsFromDictionaries:arr];
}

@end
