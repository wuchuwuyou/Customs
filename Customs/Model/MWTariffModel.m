//
//  MWTariffModel.m
//  Customs
//
//  Created by Tiny on 15/6/22.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWTariffModel.h"

@implementation MWTariffModel
+ (JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc] initWithDictionary:
            @{
                 @"codeTS":@"code",
                 @"gName":@"name",
                 @"mfnRateMax":@"MFN_max",
                 @"mfnRateMin":@"MFN_min",
                 @"commRateMax":@"general_max",
                 @"commRateMin":@"general_min",
                 @"saeanRateMax":@"ASEAN_max",
                 @"saeanRateMin":@"ASEAN_min",
                 @"hkRateMax":@"HK_max",
                 @"nkRateMin":@"HK_min",
                 @"makaoRateMax":@"MACAO_max",
                 @"makaoRateMin":@"MACAO_min",
                 @"exportRateMax":@"export_max",
                 @"exportRateMin":@"export_min",
            }];
}
@end
