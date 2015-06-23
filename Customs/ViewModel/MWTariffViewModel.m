//
//  MWTariffViewModel.m
//  Customs
//
//  Created by Tiny on 15/6/22.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWTariffViewModel.h"
#import "MWInputView.h"

typedef enum {
    TRAIFFTYPECode = 1001,
    TRAIFFTYPEName,
    TRAIFFTYPEMFNMin,
    TRAIFFTYPEMFNMax,
    TRAIFFTYPEGeneralMin,
    TRAIFFTYPEGeneralMax,
    TRAIFFTYPEAseanMin,
    TRAIFFTYPEAseanMax,
    TRAIFFTYPEHKMin,
    TRAIFFTYPEHKMax,
    TRAIFFTYPEMACAOMin,
    TRAIFFTYPEMACAOMax,
    TRAIFFTYPEExportMin,
    TRAIFFTYPEExportMax
}TRAIFFTYPE;


@interface MWTariffViewModel ()
@property (nonatomic,strong) NSArray *source;
@end

@implementation MWTariffViewModel
- (instancetype)initWithMWInputViewArray:(NSArray *)arr{
    self.source = [NSArray arrayWithArray:arr];
    _model = [[MWTariffModel alloc] init];
    [self configModel];
    return [self init];
}
- (void)configModel{
    
    for (MWInputView *iView in self.source) {
        
        [iView.inputTextSignal subscribeNext:^(NSString *value) {
            
            NSString *res = value;
            switch (iView.tag) {
                case TRAIFFTYPECode:
                    self.model.code = res;
                    break;
                case TRAIFFTYPEName:
                    self.model.name = res;
                    break;
                case TRAIFFTYPEMFNMin:
                    self.model.MFN_min = res;
                    break;
                case TRAIFFTYPEMFNMax:
                    self.model.MFN_max = res;
                    break;
                case TRAIFFTYPEGeneralMin:
                    self.model.general_min = res;
                    break;
                case TRAIFFTYPEGeneralMax:
                    self.model.general_max = res;
                    break;
                case TRAIFFTYPEAseanMin:
                    self.model.ASEAN_min = res;
                    break;
                case TRAIFFTYPEAseanMax:
                    self.model.ASEAN_max = res;
                    break;
                case TRAIFFTYPEHKMin:
                    self.model.HK_min = res;
                    break;
                case TRAIFFTYPEHKMax:
                    self.model.HK_max = res;
                    break;
                case TRAIFFTYPEMACAOMin:
                    self.model.MACAO_min = res;
                    break;
                case TRAIFFTYPEMACAOMax:
                    self.model.MACAO_max = res;
                    break;
                case TRAIFFTYPEExportMin:
                    self.model.export_min = res;
                    break;
                case TRAIFFTYPEExportMax:
                    self.model.export_max = res;
                    break;
                default:
                    break;
            }
            }];
       }
}
@end
