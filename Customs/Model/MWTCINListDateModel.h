//
//  MWTCINListDateModel.h
//  Customs
//
//  Created by Tiny on 15/7/2.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "JSONModel.h"

@interface MWTCINListDateModel : JSONModel
//-- TARIFF_NO  ： 税则列号
@property (nonatomic,strong) NSString *TARIFF_NO;
//-- TARIFF_NAME  ：子目条文
@property (nonatomic,strong) NSString *TARIFF_NAME;
//-- COMMENTARY_VIEW  ：注释
@property (nonatomic,strong) NSString *COMMENTARY_VIEW;

@property (nonatomic,strong) NSString *COMMENTARY_SEARCH;

@property (nonatomic,strong) NSString *CHAPTER_NO;
@end
