//
//  MWListDataModel.h
//  Customs
//
//  Created by Tiny on 15/6/20.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "JSONModel.h"

@interface MWListDataModel : JSONModel
@property (nonatomic,strong) NSString <Optional>*source_no;
@property (nonatomic,strong) NSString <Optional>*source_name;
@property (nonatomic,strong) NSString <Optional>*source_rate;
@end
