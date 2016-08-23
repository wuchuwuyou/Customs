//
//  MWTCINViewModel.h
//  Customs
//
//  Created by Tiny on 15/7/2.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "RVMViewModel.h"

@interface MWTCINViewModel : RVMViewModel

typedef enum : NSUInteger {
    MWTCINTypeClass = 0,
    MWTCINTypeChapter,
    MWTCINTypeSection
} MWTCINType;

///用于存储列表页数据
@property (nonatomic,strong) NSArray *listArray;
///页码 用于数据请求
@property (nonatomic,assign) NSInteger page_index;
///页数 用于数据请求
@property (nonatomic,assign) NSInteger page_size;
/// 是否能加载更多
@property (nonatomic,assign) BOOL canLoadMore;

@property (nonatomic ,readonly) NSString *subTitle;
@property (nonatomic ,readonly) NSString *keyword;
@property (nonatomic ,readonly) NSString *name;

//搜索结果页面传0 其他传1
@property (nonatomic,strong) NSNumber *searchType;

- (void)subtitle:(NSString *)sb keyword:(NSString *)k;
- (void)subtitle:(NSString *)sb keyword:(NSString *)k name:(NSString *)n;
///字典数组 －> 模型数组
- (NSArray *)modelArrayWithArray:(NSArray *)arr;
///请求数据
- (RACSignal *)queryTCIN;
- (RACSignal *)queryTCINCH;
- (RACSignal *)queryJG;
+ (RACSignal *)loadDetailData:(NSString *)tariffNo;
@end
