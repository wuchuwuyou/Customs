//
//  MWTariffListDataModel.h
//  Customs
//
//  Created by Tiny on 15/7/1.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "JSONModel.h"

@interface MWTariffListDataModel : JSONModel
///-- G_NAME  ： 货物名称
@property (nonatomic,strong) NSString <Optional>*G_NAME;
///-- CODE_TS  ： 商品编码
@property (nonatomic,strong) NSString <Optional>*CODE_TS;

///-- COMM_RATE  ：普通税率
@property (nonatomic,strong) NSString <Optional>*COMM_RATE;
///-- ASEAN_RATE  ：东盟税率
@property (nonatomic,strong) NSString <Optional>*ASEAN_RATE;

///-- HK_RATE  ： 香港税率
@property (nonatomic,strong) NSString <Optional>*HK_RATE;
///-- MACAO_RATE  ：澳门税率
@property (nonatomic,strong) NSString <Optional>*MACAO_RATE;

///-- EXPORT_RATE  ：出口税率
@property (nonatomic,strong) NSString <Optional>*EXPORT_RATE;
///-- APTA_RATE   ： 亚太税率
@property (nonatomic,strong) NSString <Optional>*APTA_RATE;

///-- MFN_RATE   ：最惠国税率
@property (nonatomic,strong) NSString <Optional>*MFN_RATE;
///-- REMARK : 备注
@property (nonatomic,strong) NSString <Optional>*REMARK;
@end
