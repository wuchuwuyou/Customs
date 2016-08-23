//
//  MWTCINListDateModel.m
//  Customs
//
//  Created by Tiny on 15/7/2.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWTCINListDateModel.h"

@implementation MWTCINListDateModel
- (NSString *)Chapter{
    NSInteger a = self.TARIFF_NO.integerValue;
    NSInteger cha = a/100;
    NSInteger sec = a%100;
    return [NSString stringWithFormat:@"第%zd章",cha];
}
- (NSString<Ignore> *)Section {
    NSInteger a = self.TARIFF_NO.integerValue;
    NSInteger cha = a/100;
    NSInteger sec = a%100;
    return [NSString stringWithFormat:@"第%zd节",sec];
}
- (NSString<Ignore> *)title {
    NSMutableString * h = [NSMutableString stringWithString:_TARIFF_NO];
    NSLog(@"h length :%zd", h.length);
    NSLog(@"h :%@",h);

    [h replaceOccurrencesOfString:@" " withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, h.length)];
    NSLog(@"h length :%zd", h.length);
    NSLog(@"h :%@",h);
    
    if ([h hasPrefix:@"CA"]) {
        NSString *no = [h substringWithRange:NSMakeRange(2, h.length-2)];
        NSLog(@"no :%@",no);

        return [NSString stringWithFormat:@"第%@类",no];
    }else if ([h hasPrefix:@"CH"]) {
        NSString *no = [h substringWithRange:NSMakeRange(2, h.length-2)];
        NSLog(@"no :%@",no);
        return [NSString stringWithFormat:@"第%@章",no];
    }else{
        NSLog(@"h :%@",h);
        return [NSString stringWithFormat:@"第%@节",h];
        return h;
    }
}
@end


@implementation MWTCINDetailDataModel



@end