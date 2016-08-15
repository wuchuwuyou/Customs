//
//  MWKeyCommoditiesModel.h
//  Customs
//
//  Created by Tiny on 15/7/3.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "JSONModel.h"

@interface MWKeyCommoditiesModel : JSONModel


@property (nonatomic,strong) NSString <Optional>*ID;
///CODE_TS  ： 商品编码
@property (nonatomic,strong) NSString <Optional>*CODE_TS;
///-- G_NAME  ： 商品名称
@property (nonatomic,strong) NSString <Optional>*G_NAME;
///-- G_MODEL  ： 规格型号
@property (nonatomic,strong) NSString <Optional>*G_MODEL;
///-- KEY_WORD  ： 关键字
@property (nonatomic,strong) NSString <Optional>*KEY_WORD;
///-- G_DESC  : 商品描述
@property (nonatomic,strong) NSString <Optional>*G_DESC;

@property (nonatomic,strong) NSString <Optional>*TRADE_NAME;

@property (nonatomic,strong) NSString <Optional>*CORP_TYPE;

@property (nonatomic,strong) NSString <Optional>*IE_FLAG;

@property (nonatomic,strong) NSString <Optional>*CUSTOMS_CODE;

@property (nonatomic,strong) NSString <Optional>*CUSTOMS_NAME;

@property (nonatomic,strong) NSString <Optional>*REMARK;

@property (nonatomic,strong) NSString <Optional>*IS_MAINTANCE;


@end
