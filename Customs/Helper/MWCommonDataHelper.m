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
    
    for (NSInteger i = 0; i<10 ; i++) {
        
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
    return data;
}

- (NSArray *)keyCommoditiesListWithModel:(MWKeyCommoditiesModel *)model{
    NSMutableArray *data = [NSMutableArray array];
    NSDictionary *dict = [model toDictionary];
    NSArray *array = dict.allKeys;
    NSInteger num = array.count;
    
    for (NSInteger i = 0; i<5; i++) {
        
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
                m.name = NSLocalizedString(@"specification_model", @"规格型号");
                m.content = model.G_MODEL;
                break;
            case 3:
                m.name = NSLocalizedString(@"keywords", @"关键字");
                m.content = model.KEY_WORD;
                break;
            case 4:
                m.name = NSLocalizedString(@"goods_description", @"商品描述");
                m.content = model.G_DESC;
                break;
            default:
                break;
        }
        
        [data addObject:m];
    }
    return data;

}

- (NSArray *)GLJDListWithModel:(MWGLJDListModel *)model{
    NSMutableArray *data = [NSMutableArray array];
    
    NSInteger num = [model toDictionary].allKeys.count;
    
    for (NSInteger i = 0; i<8 ; i++) {
        
        MWCommonModel *m = [[MWCommonModel alloc] init];
        
        switch (i) {
            case 0:
                m.name = NSLocalizedString(@"correlation_number", @"相关编号");
                m.content = model.SOURCE_NO;
                break;
            case 1:
                m.name = NSLocalizedString(@"tariff_decision", @"决定税号");
                m.content = model.CODE_TS;
                break;
            case 2:
                m.name = NSLocalizedString(@"specification_model", @"规格型号");
                m.content = model.G_MODEL;
                break;
            case 3:
                m.name = NSLocalizedString(@"cn_name", nil);
                m.content = model.G_NAME;
                break;
            case 4:
                m.name = NSLocalizedString(@"eng_name", nil);
                m.content = model.G_NAME_EN;
                break;
            case 5:
                m.name = NSLocalizedString(@"other_name", nil);
                m.content = model.G_NAME_OTHER;
                break;
            case 6:
                m.name = NSLocalizedString(@"goods_description", nil);
                m.content = model.G_DESCRIPTION;
                break;
            case 7:
                m.name = NSLocalizedString(@"classified_opinion", nil);
                m.content = model.CLASSIFY_ADJUST;
                break;
            default:
                break;
        }
        
        [data addObject:m];
    }
    return data;
}
- (NSArray *)labStatusWithModel:(MWLabModel *)model{
    NSMutableArray *data = [NSMutableArray array];
    
    NSInteger num = [model toDictionary].allKeys.count;
    
    for (NSInteger i = 0; i<5 ; i++) {
        
        MWCommonModel *m = [[MWCommonModel alloc] init];
        
        switch (i) {
            case 0:
                m.name = NSLocalizedString(@"order_no", @"化验单号");
                m.content = model.APPLICATIONID;
                break;
            case 1:
                m.name = NSLocalizedString(@"lab_no", @"报关单号");
                m.content = model.ENTRYID;
                break;
            case 2:
                m.name = NSLocalizedString(@"cargo_name", @"货物名称");
                m.content = model.APPNAME;
                break;
            case 3:
                m.name = NSLocalizedString(@"lab_status", @"化验状态");
                m.content = model.APPSTATUS;
                break;
            case 4:
                m.name = NSLocalizedString(@"update_time", @"更新时间");
                m.content = model.UPDATETIME;
                break;
            default:
                break;
        }
        
        [data addObject:m];
    }
    return data;
}
@end
