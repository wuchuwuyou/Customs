//
//  MWTariffModel.h
//  Customs
//
//  Created by Tiny on 15/6/22.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "JSONModel.h"
/// 进出口税则
@interface MWTariffModel : JSONModel
///列号
@property (nonatomic,strong) NSString *code;
///名称
@property (nonatomic,strong) NSString *name;
///最惠国税率
@property (nonatomic,strong) NSString *MFN_max;
@property (nonatomic,strong) NSString *MFN_min;
///普通税率
@property (nonatomic,strong) NSString *general_max;
@property (nonatomic,strong) NSString *general_min;
///协定税率－东盟
@property (nonatomic,strong) NSString *ASEAN_max;
@property (nonatomic,strong) NSString *ASEAN_min;
///协定税率－香港
@property (nonatomic,strong) NSString *HK_max;
@property (nonatomic,strong) NSString *HK_min;
///协定税率－澳门
@property (nonatomic,strong) NSString *MACAO_max;
@property (nonatomic,strong) NSString *MACAO_min;
///出口税率
@property (nonatomic,strong) NSString *export_max;
@property (nonatomic,strong) NSString *export_min;

@end
