//
//  MWTCINViewModel.h
//  Customs
//
//  Created by Tiny on 15/7/2.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "RVMViewModel.h"

@interface MWTCINViewModel : RVMViewModel

///用于存储列表页数据
@property (nonatomic,strong) NSArray *listArray;
///页码 用于数据请求
@property (nonatomic,assign) NSInteger page_index;
///页数 用于数据请求
@property (nonatomic,assign) NSInteger page_size;
/// 是否能加载更多
@property (nonatomic,assign) BOOL canLoadMore;

- (void)subtitle:(NSString *)sb keyword:(NSString *)k;
///字典数组 －> 模型数组
- (NSArray *)modelArrayWithArray:(NSArray *)arr;
///请求数据
- (RACSignal *)queryTCIN;

@end