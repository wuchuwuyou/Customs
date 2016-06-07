//
//  MWSearchViewModel.h
//  Customs
//
//  Created by Murphy on 16/6/7.
//  Copyright © 2016年 Murphy. All rights reserved.
//

#import <ReactiveViewModel/ReactiveViewModel.h>
#import "MWSearchResultModel.h"
@interface MWSearchViewModel : RVMViewModel
- (instancetype) initWithKeywords:(NSString *)keywords;
@property (nonatomic,copy,readonly) NSString *keywords;
@property (nonatomic,strong) NSArray <MWSearchResultModel *> *listArray;
- (RACSignal *)requestSearchData;
- (void)modelArrayFromDataArray:(NSArray *)array;
@end
