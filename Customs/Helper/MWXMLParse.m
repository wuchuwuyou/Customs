//
//  MWXMLParse.m
//  Customs
//
//  Created by Murphy on 16/6/2.
//  Copyright © 2016年 Murphy. All rights reserved.
//

#import "MWXMLParse.h"
#import <XMLDictionary.h>

@implementation MWXMLParse
+ (NSDictionary *)dictForXMLData:(NSData *)data {
    NSDictionary *dict = [NSDictionary dictionaryWithXMLData:data];
    NSString *str = [dict innerText];
    NSData *resp = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error ;
    NSDictionary * respDict = [NSJSONSerialization JSONObjectWithData:resp options:NSJSONReadingAllowFragments error:&error];
    if (error) {
        NSAssert(error, @"json 解析错误");
        return nil;
    }
    return respDict;
}
@end
