//
//  MWCommonModel.h
//  Customs
//
//  Created by Tiny on 15/7/1.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "JSONModel.h"

@interface MWCommonModel : JSONModel
///显示名字
@property (nonatomic,strong) NSString *name;
///对应显示数据
@property (nonatomic,strong) NSString *content;
/// 是否显示更多
@property (nonatomic,assign) BOOL isMore;

@end
