//
//  MWTCINListDateModel.m
//  Customs
//
//  Created by Tiny on 15/7/2.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWTCINListDateModel.h"

@implementation MWTCINListDateModel
- (NSString *)CHAPTER_NO{
    NSInteger a = self.TARIFF_NO.integerValue;
    NSInteger cha = a/100;
    NSInteger sec = a%100;
    return [NSString stringWithFormat:@"第%zd章第%zd节",cha,sec];
}
@end


@implementation MWTCINDetailDataModel



@end