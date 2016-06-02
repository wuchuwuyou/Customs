//
//  MWLabViewModel.m
//  Customs
//
//  Created by Tiny on 15/7/8.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWLabViewModel.h"
#import "MWLocalStorage.h"
@interface MWLabViewModel ()
@property (nonatomic,strong) NSString *orderNo;
@end

@implementation MWLabViewModel

- (instancetype)initWithOrderNo:(NSString *)orderNo{
    
    if ( self = [super init]) {
        self.orderNo = orderNo;
    }
    return self;
}

- (RACSignal *)requestData{
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    [data setValue:self.orderNo forKey:@"entryId"];
    [data setValue:@"status" forKey:@"flag"];
    return [[MWAPIManager sharedManager] requestWithPath:[MWAPIHelper labStatusURL] andParameters:data];
}
- (BOOL)attention:(BOOL)status {
    if (status) {
      return [MWLocalStorage addAttentionWithEntryID:self.orderNo];
    }else {
        return [MWLocalStorage removeAttentionWithEntryID:self.orderNo];
    }
}
@end
