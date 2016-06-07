//
//  MWGLJDViewModel.m
//  Customs
//
//  Created by Tiny on 15/7/6.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWGLJDViewModel.h"
#import "MWGLJDListModel.h"
#import "MWInputView.h"


typedef enum {
    GLJDTYPECode = 1001,
    GLJDTYPEName,
    GLJDTYPEJDTariff,
    GLJDTYPEGGXinghao,
    GLJDTYPEEngName,
    GLJDTYPEOtherName
}GLJDTYPE;


@interface MWGLJDViewModel ()
@property (nonatomic,strong) NSArray *source;
@end

@implementation MWGLJDViewModel
- (instancetype)initWithInputViewArray:(NSArray *)arr{
    
    if ( self = [super init]) {
        self.source = arr;
        _reqModel = [[MWGLJDReqModel alloc] init];
        self.page_index = 1;
        self.page_size = PAGESIZE;
        self.canLoadMore = YES;
        [self configModel];
    }
    return self;
}
- (void)configModel{
    for (MWInputView *iView in self.source) {
        
        [iView.inputTextSignal subscribeNext:^(NSString *value) {
            
            NSString *res = value;
            switch (iView.tag) {
                case GLJDTYPECode:
                    self.reqModel.sourceNo = res;
                    break;
                case GLJDTYPEName:
                    self.reqModel.gName = res;
                    break;
                case GLJDTYPEJDTariff:
                    self.reqModel.codeTS = res;
                    break;
                case GLJDTYPEGGXinghao:
                    self.reqModel.gModel = res;
                    break;
                case GLJDTYPEEngName:
                    self.reqModel.gNameEn = res;
                    break;
                case GLJDTYPEOtherName:
                    self.reqModel.gNameOther = res;
                    break;
                default:
                    break;
            }
        }];
    }

}
- (RACSignal *)requestListData{
    
    NSMutableDictionary *data = [NSMutableDictionary dictionaryWithDictionary:[self.reqModel toDictionary]];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    switch (self.type) {
        case MWGLSearchTypeJD:
            [data setValue:@"D" forKey:@"dataSourceType"];
            
            break;
        case MWGLSearchTypeCD:
            [data setValue:@"R" forKey:@"dataSourceType"];
            break;
        default:
            break;
    }
    
    [params setValue:[data getJSONString] forKey:@"jsonParams"];
    [params setValue:@"CLS00002" forKey:@"messageCode"];
    [params setValue:@(self.page_index) forKey:@"pageNo"];
    [params setValue:@(self.page_size) forKey:@"pageSize"];
    [params setValue:@"SOURCE_NO" forKey:@"orderType"];

    return [[MWAPIManager sharedManager] requestWithPath:[MWAPIHelper GLJDListURL] andParameters:params];
}
- (NSArray *)listArray{
    if (!_listArray) {
        _listArray = [NSArray array];
    }
    return _listArray;
}
- (NSArray *)modelArrayWithArray:(NSArray *)arr{
    return [MWGLJDListModel arrayOfModelsFromDictionaries:arr];
}
@end
