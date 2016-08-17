//
//  MWGLJDViewModel.h
//  Customs
//
//  Created by Tiny on 15/7/6.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "RVMViewModel.h"
#import "MWGLJDReqModel.h"
@interface MWGLJDViewModel : RVMViewModel

///用于存储列表页数据
@property (nonatomic,strong) NSArray *listArray;
///页码 用于数据请求
@property (nonatomic,assign) NSInteger page_index;
///页数 用于数据请求
@property (nonatomic,assign) NSInteger page_size;
/// 是否能加载更多
@property (nonatomic,assign) BOOL canLoadMore;

@property (nonatomic,assign) MWGLSearchType type;


@property (nonatomic,strong,readonly) MWGLJDReqModel *reqModel;

//搜索结果页面传0 其他传1
@property (nonatomic,strong) NSNumber *searchType;

- (instancetype) initWithInputViewArray:(NSArray *)arr;
- (instancetype) initWithModel:(MWGLJDReqModel *)model;
///字典数组 －> 模型数组
- (NSArray *)modelArrayWithArray:(NSArray *)arr;

- (RACSignal *)requestListData;
@end
