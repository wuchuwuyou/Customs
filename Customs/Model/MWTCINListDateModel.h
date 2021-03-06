//
//  MWTCINListDateModel.h
//  Customs
//
//  Created by Tiny on 15/7/2.
//  Copyright (c) 2015年 Murphy. All rights reserved.
//

#import "JSONModel.h"

@interface MWTCINListDateModel : JSONModel
///-- TARIFF_NO  ： 税则列号
@property (nonatomic,strong) NSString <Optional>*TARIFF_NO;
///-- TARIFF_NAME  ：子目条文
@property (nonatomic,strong) NSString <Optional>*TARIFF_NAME;
///-- COMMENTARY_VIEW  ：注释
@property (nonatomic,strong) NSString <Optional>*COMMENTARY_VIEW;

@property (nonatomic,strong) NSString <Optional>*COMMENTARY_SEARCH;

@property (nonatomic,strong) NSString <Optional>*CHAPTER_NO;
@property (nonatomic,copy,readonly) NSString <Ignore>*title;
@property (nonatomic,copy,readonly) NSString <Ignore>*Chapter;
@property (nonatomic,copy,readonly) NSString <Ignore>*Section;
@end


@interface MWTCINDetailDataModel : JSONModel

///-- classAnnotation 类注释
@property (nonatomic,strong) NSString <Optional>*classAnnotation;

///-- chapterAnnotation 章注释
@property (nonatomic,strong) NSString <Optional>*chapterAnnotation;

///-- itemAnnotation 品目注释
@property (nonatomic,strong) NSString <Optional>*itemAnnotation;

///-- itemAnnotation 品目注释
@property (nonatomic,strong) NSString <Optional>*shuimujiegou;


@end