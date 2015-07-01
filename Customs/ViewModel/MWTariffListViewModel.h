//
//  MWTariffListViewModel.h
//  Customs
//
//  Created by Tiny on 15/6/29.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import <RVMViewModel.h>
#import "MWTariffModel.h"
#import "MWListDataModel.h"
///列表数据模型
@interface MWTariffListViewModel : RVMViewModel 

//@property (nonatomic,strong) RACSignal *updatedContentSignal;
///用于存储列表页数据
@property (nonatomic,strong) NSArray *listArray;
///页码 用于数据请求
@property (nonatomic,assign) NSInteger page_index;
///页数 用于数据请求
@property (nonatomic,assign) NSInteger page_size;
/// 是否能加载更多
@property (nonatomic,assign) BOOL canLoadMore;
/*!
 *  @author Murphy, 2015-06-30 19:06:11
 *
 *  @brief  初始化该类方法
 *
 *  @param model 请求数据的模型类
 *
 *  @return 类对象
 */
- (instancetype)initWithModel:(MWTariffModel *)model;
/*!
 *  @author Murphy, 2015-06-30 19:06:12
 *
 *  @brief 数组字典转化成数组模型
 *
 *  @param arr 数组字典
 *
 *  @return 数组模型
 */
- (NSArray *)modelArrayWithArray:(NSArray *)arr;
/*!
 *  @author Murphy, 2015-06-30 19:06:30
 *
 *  @brief  请求数据
 *
 *  @return RACSignal 对象
 */
- (RACSignal *)queryMWTariff;
@end
