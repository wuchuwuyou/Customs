//
//  MWCommonDataHelper.m
//  Customs
//
//  Created by Tiny on 15/7/1.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWCommonDataHelper.h"
#import "MWCommonModel.h"
@implementation MWCommonDataHelper

+ (instancetype)sharedManager{
    
    static MWCommonDataHelper *instance ;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}
- (NSArray *)tariffListWithModel:(MWTariffListDataModel *)model
{
    NSMutableArray *data = [NSMutableArray array];
    
    NSInteger num = [model toDictionary].allKeys.count;
    
    for (NSInteger i = 0; i<num ; i++) {
        
        MWCommonModel *m = [[MWCommonModel alloc] init];
        
        switch (i) {
            case 0:
                m.name = NSLocalizedString(@"goods_no", @"商品编号");
                m.content = model.CODE_TS;
                break;
            case 1:
                m.name = NSLocalizedString(@"goods_name_1", @"商品名称");
                m.content = model.G_NAME;
                break;
            case 2:
                m.name = NSLocalizedString(@"MFN_tariff", @"最惠国税率");
                m.content = model.MFN_RATE;
                break;
            case 3:
                m.name = NSLocalizedString(@"general_tariff", @"普通税率");
                m.content = model.COMM_RATE;
                break;
            case 4:
                m.name = NSLocalizedString(@"conventional_tariff_ASEAN", @"协定税率(东盟)");
                m.content = model.ASEAN_RATE;
                break;
            case 5:
                m.name = NSLocalizedString(@"conventional_tariff_HongKong", @"协定税率(香港)");
                m.content = model.HK_RATE;
                break;
            case 6:
                m.name = NSLocalizedString(@"conventional_tariff_Macao", @"协定税率(澳门)");
                m.content = model.MACAO_RATE;
                break;
            case 7:
                m.name = NSLocalizedString(@"conventional_tariff_APTA", @"协定税率(亚太)");
                m.content = model.APTA_RATE;
                break;
            case 8:
                m.name = NSLocalizedString(@"export_tariff", @"出口税率");
                m.content = model.EXPORT_RATE;
                break;
            case 9:
                m.name = NSLocalizedString(@"remark", @"备注");
                m.content = model.REMARK;
                break;
            default:
                break;
        }
        
        [data addObject:m];
    }
    
    
    
//    ///-- G_NAME  ： 货物名称
//    @property (nonatomic,strong) NSString *G_NAME;
    
//    ///-- CODE_TS  ： 商品编码
//    @property (nonatomic,strong) NSString *CODE_TS;
//    
//    ///-- COMM_RATE  ：普通税率
//    @property (nonatomic,strong) NSString *COMM_RATE;
//    ///-- ASEAN_RATE  ：东盟税率
//    @property (nonatomic,strong) NSString *ASEAN_RATE;
//    
//    ///-- HK_RATE  ： 香港税率
//    @property (nonatomic,strong) NSString *HK_RATE;
//    ///-- MACAO_RATE  ：澳门税率
//    @property (nonatomic,strong) NSString *MACAO_RATE;
//    
//    ///-- EXPORT_RATE  ：出口税率
//    @property (nonatomic,strong) NSString *EXPORT_RATE;
//    ///-- APTA_RATE   ： 亚太税率
//    @property (nonatomic,strong) NSString *APTA_RATE;
//    
//    ///-- MFN_RATE   ：最惠国税率
//    @property (nonatomic,strong) NSString *MFN_RATE;
//    ///-- REMARK : 备注
//    @property (nonatomic,strong) NSString *REMARK;
    
    
    return data;
}
@end
