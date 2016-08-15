//
//  MWSearchResultModel.h
//  Customs
//
//  Created by Murphy on 16/6/7.
//  Copyright © 2016年 Murphy. All rights reserved.
//

#import "JSONModel.h"

@interface MWSearchResultModel : JSONModel
@property (nonatomic,strong) NSNumber <Optional>*RESULT_COUNT;
@property (nonatomic,copy) NSString <Optional>*Sort;
- (NSString *)title;
//@property (nonatomic,copy) NSString *title;
- (NSString *)showCount;
//@property (nonatomic,copy) NSString *showCount;
@end
