//
//  MWSearchResultModel.m
//  Customs
//
//  Created by Murphy on 16/6/7.
//  Copyright © 2016年 Murphy. All rights reserved.
//

#import "MWSearchResultModel.h"

@implementation MWSearchResultModel
- (NSString *)title {
    NSInteger rs = _Sort.integerValue;
    NSString *result  = @"";
/*
 1——归类决定
 
 3——归类裁定
 
 13——重点商品
 
 97——本国子目
 
 95——进出口税则
 
 96——税则品目注释
 
 */
    switch (rs) {
        case 1:
            result = @"归类决定";
            break;
        case 3:
            result = @"归类裁定";
            break;
        case 13:
            result = @"重点商品";
            break;
        case 97:
            result = @"本国子目";
            break;
        case 95:
            result = @"进出口税则";
            break;
        case 96:
            result = @"税则品目注释";
            break;
        default:
            break;
    }
    return result;
}
- (NSString *)showCount {
    return [NSString stringWithFormat:@"%zd条",_RESULT_COUNT];
}
@end
