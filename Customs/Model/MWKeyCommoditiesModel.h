//
//  MWKeyCommoditiesModel.h
//  Customs
//
//  Created by Tiny on 15/7/3.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "JSONModel.h"

@interface MWKeyCommoditiesModel : JSONModel


@property (nonatomic,strong) NSString *ID;
///CODE_TS  ： 商品编码
@property (nonatomic,strong) NSString *CODE_TS;
///-- G_NAME  ： 商品名称
@property (nonatomic,strong) NSString *G_NAME;
///-- G_MODEL  ： 规格型号
@property (nonatomic,strong) NSString *G_MODEL;
///-- KEY_WORD  ： 关键字
@property (nonatomic,strong) NSString *KEY_WORD;
///-- G_DESC  : 商品描述
@property (nonatomic,strong) NSString *G_DESC;

@property (nonatomic,strong) NSString *TRADE_NAME;

@property (nonatomic,strong) NSString *CORP_TYPE;

//@property (nonatomic,strong) NSString *IE_FLAG;

@property (nonatomic,strong) NSString *CUSTOMS_CODE;

@property (nonatomic,strong) NSString *CUSTOMS_NAME;

@property (nonatomic,strong) NSString *REMARK;

@property (nonatomic,strong) NSString *IS_MAINTANCE;


@end
