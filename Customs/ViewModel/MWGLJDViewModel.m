//
//  MWGLJDViewModel.m
//  Customs
//
//  Created by Tiny on 15/7/6.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "MWGLJDViewModel.h"
#import "MWGLJDListModel.h"


@interface MWGLJDViewModel ()
@property (nonatomic,strong) NSArray *source;
@end

@implementation MWGLJDViewModel
- (instancetype)initWithInputViewArray:(NSArray *)arr{
    
    if ( self = [super init]) {
        self.source = arr;
    }
    return self;
}
@end
