//
//  MWProtocols.h
//  Customs
//
//  Created by Tiny on 15/6/29.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class RACSignal;

@protocol MWProtocols <NSObject>

@end

@protocol MWListProtoclos <NSObject>

- (RACSignal *)requestWithParames:(NSDictionary *)parames withIndex:(NSInteger)index andSize:(NSInteger)size;
- (RACSignal *)loadMore;
@end